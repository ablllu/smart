package com.bbpp.smartbackend.modules.upload.controller;


import com.bbpp.smartbackend.common.properties.UploadProperties;
import com.bbpp.smartbackend.common.result.Result;
import com.bbpp.smartbackend.modules.upload.vo.UploadVO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;


import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Tag(name = "文件上传")
@RestController
@RequestMapping("/upload")
public class UploadController {

    private final UploadProperties uploadProperties;

    public UploadController(UploadProperties uploadProperties) {
        this.uploadProperties = uploadProperties;
    }

    @Operation(summary = "上传图片")
    @PostMapping("/image")
    public Result<UploadVO> upload(
            @RequestParam("file") MultipartFile file
    ) throws Exception {

        if (file.isEmpty()) {
            return Result.error(400, "文件不能为空");
        }

        String originalFilename = file.getOriginalFilename();

        // 增加一个空指针保护，防止文件名不含后缀
        if (originalFilename == null || !originalFilename.contains(".")) {
            return Result.error(400, "文件名不合法");
        }

        String suffix = originalFilename.substring(originalFilename.lastIndexOf("."));
        String fileName = UUID.randomUUID() + suffix;

        // 从配置上传路径
        String uploadDir = uploadProperties.getPath();

        // 创建目录 (使用绝对路径)
        File dir = new File(uploadDir);
        if (!dir.exists()) {
            dir.mkdirs();
        }

        // 保存文件 (使用绝对路径)
        File dest = new File(dir, fileName);

        try {
            file.transferTo(dest);
        } catch (IOException e) {
            e.printStackTrace();
            return Result.error(500, "文件保存失败");
        }

        // 返回访问路径
        String url = "/uploads/" + fileName;

        return Result.success(new UploadVO(fileName, url));
    }
}

