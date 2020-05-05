class Size < ActiveHash::Base
  self.data = [
    # 洋服のサイズ
    { id: 1, value: 'XXS以下' },
    { id: 2, value: 'XS(SS)' },
    { id: 3, value: 'S' },
    { id: 4, value: 'M' },
    { id: 5, value: 'L' },
    { id: 6, value: 'XL(LL)' },
    { id: 7, value: '2XL(3L)' },
    { id: 8, value: '3XL(4L)' },
    { id: 9, value: '4XL(5L)以上' },
    { id: 10, value: 'FREE SIZE' },
    # 必須項目のため空のバリューを用意
    { id: 99, value: 'その他', group: '' }
  ]
end