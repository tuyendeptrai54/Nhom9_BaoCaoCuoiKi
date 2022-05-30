<template>
  <div class="container">
    
    <div>
      <Favorite :product="product"  :view ="hide" @start="getProductsBySort"
      @edit-Quantily="addCart" />
    </div>
    
 </div>
</template>
<script>
import { mapGetters, mapActions } from 'vuex'
import { cloneDeep } from 'lodash-es'
import Favorite from '../components/index/Favorite.vue'

import catalogApi from '@/api/catalogApi'


export default {
  components: { Favorite },
  data() {
    return {
      product: '',
      hide: false,
      cart:[]
      
    }
  },
  computed: {
    ...mapGetters({
      getIndex: 'user/getIndex',
      getCart: 'user/getCart',
    }),
  },
  async created() {
    await this.getOneProduct(this.getIndex)
  },

  methods: {
     ...mapActions({
      setCart: 'user/setCart',
    }),
  async addCart(number) {
      function isNguyen(n) {
        let check = 1
        if (Math.ceil(n) !== Math.floor(n)) check = 0
        return check
      }

      if (
        number > 0 &&
        isNguyen(number) === 1 &&
        number <= this.product.inStocks
      ) {
        if (cloneDeep(this.getCart).length !== 0) {
          this.cart = cloneDeep(this.getCart)
        }

        const name = this.product.productName
        let num
        const isTrue = this.cart.some(function (ca, index) {
          num = index
          return ca.productName === name
        })

        const addCart = {
          productName: this.product.productName,
          quantily: number,
          price: this.product.price,
          avatar: this.product.avatar,
          inStocks:this.inStocks
        }
        if (isTrue === false) {
          this.cart.push(addCart)
           this.$swal.fire({
              position: 'top-mid',
              icon: 'success',
              title: 'Success',
              showConfirmButton: false,
              timer: 1500,
            })
            await this.setCart(this.cart)
            this.$router.push('/cart')

        } else {
          const check = Number(this.cart[num].quantily) + Number(number)
          // alert(check)
          if (check <= this.product.inStocks) {
            this.cart[num].quantily = Number(this.cart[num].quantily) +   Number(number)
            this.$swal.fire({
              position: 'top-mid',
              icon: 'success',
              title: 'Success',
              showConfirmButton: false,
              timer: 1500,
            })
            await this.setCart(this.cart)
            this.$router.push('/cart')
          } else {
             
            this.$swal.fire({
              position: 'top-mid',
              icon: 'error',
              title:
              
                'Tổng số lượng  sản phẩm trong giỏ sau khi đặt là : ' + check  + '.Bạn đặt vượt quá kho hàng .Vui lòng nhập lại!',
              showConfirmButton: false,
              timer: 1500,
            })
          }
        }
      } else {
        this.$swal.fire({
          position: 'top-mid',
          icon: 'error',
          title:
            'Số lượng  sản phẩm   bị lỗi.Vui lòng nhập lại!',
          showConfirmButton: false,
          timer: 1500,
        })
      }
    },
    
    async getOneProduct(index) {
      try {
       
        const { data } = await catalogApi.getProductsById(this.$axios, index)
         

        this.product = data
      } catch (err) {
        console.log(err)
      }
    },
  },
}
</script>
