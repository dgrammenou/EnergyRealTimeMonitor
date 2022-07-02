export interface ChartDto {
    name: string;
    series: ChartDataDto[];
}

export interface ChartDataDto {
    name: string;
    value: number;
}