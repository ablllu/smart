package com.bbpp.smartbackend.modules.statistics.controller;


import com.bbpp.smartbackend.common.result.Result;
import com.bbpp.smartbackend.modules.statistics.service.StatisticsService;
import com.bbpp.smartbackend.modules.statistics.vo.StatisticsVO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Tag(name = "首页统计")
@RestController
@RequestMapping("/admin/statistics")
public class StatisticsController {

    private final StatisticsService statisticsService;


    public StatisticsController(StatisticsService statisticsService) {
        this.statisticsService = statisticsService;
    }

    @Operation(summary = "首页概览")
    @GetMapping("/overview")
    public Result<StatisticsVO> overview() {
        StatisticsVO statisticsVO = statisticsService.overview();
        return Result.success(statisticsVO);
    }
}
