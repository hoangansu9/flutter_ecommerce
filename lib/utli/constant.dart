class Constant {
  /* ? Table Category */

  static const TABLE_CATEGORY = "Category";
  static const CATEGORY_ID = "id";
  static const CATEGORY_NAME = "categoryName";
  static const CATEGORY_IMAGE_URL = "imageUrl";

  /* ? Table Category */

  static const TABLE_PRODUCT = "Product";
  static const PRODUCT_ID = "id";
  static const PRODUCT_NAME = "productName";
  static const PRODUCT_IMAGE_URL = "imageUrl";
  static const PRODUCT_DESCRIPTION = "productDescription";
  static const PRODUCT_PRICE = "productPrice";
  static const PRODUCT_IS_DISCOUNT = "isDiscount";
  static const PRODUCT_DISCOUNT_PRICE = "discountedPrice";
  static const PRODUCT_CATEGORY_ID = "idCategory";

  static const CREATE_CATEGORY = "CREATE TABLE " +
      TABLE_CATEGORY +
      "(" +
      CATEGORY_ID +
      " INTEGER PRIMARY KEY," +
      CATEGORY_NAME +
      " TEXT," +
      CATEGORY_IMAGE_URL +
      " TEXT" +
      ")";
  static const CREATE_PRODUCT = "CREATE TABLE " +
      TABLE_PRODUCT +
      "(" +
      PRODUCT_ID +
      " INTEGER PRIMARY KEY," +
      PRODUCT_NAME +
      " TEXT," +
      PRODUCT_IMAGE_URL +
      " TEXT," +
      PRODUCT_DESCRIPTION +
      " TEXT," +
      PRODUCT_PRICE +
      " FLOAT," +
      PRODUCT_IS_DISCOUNT +
      " BIT," +
      PRODUCT_DISCOUNT_PRICE +
      " TEXT," +
      PRODUCT_CATEGORY_ID +
      " TEXT," +
      " FOREIGN KEY (" +
      PRODUCT_CATEGORY_ID +
      ") REFERENCES " +
      TABLE_CATEGORY +
      "(" +
      CATEGORY_ID +
      ")" +
      ")";
}
