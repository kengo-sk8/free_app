# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories=[
           {level1:"カテゴリ 1",level1_children:[
                                               {level2:"カテゴリ 1-1",level2_children:["カテゴリ 1-1-1","カテゴリ 1-1-2","カテゴリ 1-1-3"]},
                                               {level2:"カテゴリ 1-2",level2_children:["カテゴリ 1-2-1","カテゴリ 1-2-2"]}
                                              ]
           },
           {level1:"カテゴリ 2",level1_children:[
                                               {level2:"カテゴリ 2-1",level2_children:["カテゴリ 2-1-1","カテゴリ 2-1-2","カテゴリ 2-1-3"]},
                                               {level2:"カテゴリ 2-2",level2_children:["カテゴリ 2-2-1","カテゴリ 2-2-2"]}
                                              ]
           }
         ]
categories.each.with_index(1) do |category,i|
 level1_var="@category#{i}"                                                        #1階層の変数("@category1"等)
 level1_val= Category.create(name:"#{category[:level1]}")                          #1階層の値作成("カテゴリ 1"等)
 eval("#{level1_var} = level1_val")                                                #1階層の変数=1階層の値
   category[:level1_children].each.with_index(1) do |level1_child,j|
     level2_var="#{level1_var}_#{j}"                                               #2階層の変数("@category1-1"等)
     level2_val= eval("#{level1_var}.children.create(name:level1_child[:level2])") #2階層の値作成("カテゴリ 1-1"等)
     eval("#{level2_var} = level2_val")                                            #2階層の変数=2階層の値
       level1_child[:level2_children].each do |level2_children_val|
         eval("#{level2_var}.children.create(name:level2_children_val)")           #3階層の値作成("カテゴリ 1-1-1"等)
       end
   end
end
