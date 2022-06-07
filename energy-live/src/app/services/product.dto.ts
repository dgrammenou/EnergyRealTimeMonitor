export interface ListDto {
    data: ProductDto[];
    pages: number;
}

export interface ProductListDto {
    products: ProductDto[];
}

export interface ProductDto {
    id: number;
    
    product : string;
    price: number;
    metric: string; 
    supermarket: string;

    company ?: string;
    category ?: string;
    
    img ?: string;
    url ?: string;

    ratio ?: number;
    weight ?: number;

    discount ?: boolean;
}