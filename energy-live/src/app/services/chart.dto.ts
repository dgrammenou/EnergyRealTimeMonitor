export interface ChartDto {
    name: string;
    series: ChartDataDto[];
    lastUpdate: string;
}

export interface ChartDataDto {
    name: string;
    value: number;
}
/*
{
    name: "title";
    series: [
        {name: "imeronia 1", value: 53.2},
        {name: "imeronia 2", value: 53.2},
        {name: "imeronia 3", value: 53.2},
        {name: "imeronia 4", value: 53.2},
    ]
}

*/