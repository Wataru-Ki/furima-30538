| User                       | Profile                            | Item                             | Comment                 | 
| -------------------------- | ---------------------------------- | -------------------------------- | ----------------------- | 
| email : string, NOTNULL    | first_name : string, NOTNULL       | item_name : string, NOTNULL      | comment : text, NOTNULL | 
| nickname : string, NOTNULL | family_name : string, NOTNULL      | seller_name : string, NOTNULL    | user : references       | 
| password : string,NOTNULL  | first_name_kana : string, NOTNULL  | category : string, NOTNULL       | item : references       | 
|                            | family_name_kana : string, NOTNULL | introduction : text, NOTNULL     |                         | 
|                            | birth_year : date, NOTNULL         | item_condition : string,NOTNULL  |                         | 
|                            | birth_month : date, NOTNULL        | price : integer, NOTNULL         |                         | 
|                            | birth_day : date, NOTNULL          | prefecture_id : integer, NOTNULL |                         | 
|                            | user : references                  | user : references                |                         | 
|                            |                                    | image : ActiveStrageで実装       |                         | 