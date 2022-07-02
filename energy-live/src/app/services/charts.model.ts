export interface Chart {
    date: Date;
}
export interface ActualTotalLoad extends Chart{
    country: string;
}

export interface GenerationPerType extends Chart {
    country: string;
    generationType: string;
}


export interface CrossBoarderFlow extends Chart {
    countryFrom: string;
    countryTo: string;
}


