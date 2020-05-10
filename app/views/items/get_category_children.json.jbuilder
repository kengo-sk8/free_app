json.array! @category_children do |child| 
  json.id child.id 
  json.name child.name
end

#json.array!は、インスタンス変数のデータが複数ある場合に使用する。
#itemコントローラの@category_childrenから値を取得している