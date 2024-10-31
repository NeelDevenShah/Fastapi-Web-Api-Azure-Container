from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

class Item(BaseModel):
    name: str
    description: str = None
    price: float
    tax: float = 0.0

@app.get("/")
def read_root():
    return {"Hello": "World"}

@app.post("/items/")
def create_item(item: Item):
    item_with_tax = item.price + item.tax
    return {"name": item.name, "price_with_tax": item_with_tax}
