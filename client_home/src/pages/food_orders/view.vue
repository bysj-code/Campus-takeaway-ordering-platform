<template>
  <view>
    <view class="container diy_view">
      <view>
        <view>
          <view class="">
            <uni-forms :modelValue="form"  v-if="is_view()">

              <uni-forms-item v-if="$check_field('get','order_number') || ($check_field('add','order_number') || $check_field('set','order_number'))" label="订单编号" name="order_number">
                            <uni-easyinput type="text" v-model="form['order_number']" v-if="user_group === '管理员' || (form['food_orders_id'] && $check_field('set','order_number')) || (!form['food_orders_id'] && $check_field('add','order_number'))"  :disabled="true" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','order_number')">
                  {{ form['order_number'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','store_name') || ($check_field('add','store_name') || $check_field('set','store_name'))" label="店铺名称" name="store_name">
                            <uni-easyinput type="text" v-model="form['store_name']" v-if="user_group === '管理员' || (form['food_orders_id'] && $check_field('set','store_name')) || (!form['food_orders_id'] && $check_field('add','store_name'))" :disabled="disabledObj['store_name_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','store_name')">
                  {{ form['store_name'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','merchant_users') || ($check_field('add','merchant_users') || $check_field('set','merchant_users'))" label="商家用户" name="merchant_users">
                    <uni-data-select
                  id="form_merchant_users"
                  v-model="form['merchant_users']"
                  :localdata="list_user_merchant_users"
                  :clear="!disabledObj['merchant_users_isDisabled']"
                  :disabled="disabledObj['merchant_users_isDisabled']"
                  v-if="user_group === '管理员' || (form['food_orders_id'] && $check_field('set','merchant_users')) || (!form['food_orders_id'] && $check_field('add','merchant_users'))"
                ></uni-data-select>
                <uni-data-select
                  v-model="form['merchant_users']"
                  :localdata="list_user_merchant_users"
                  :clear="false"
                  :disabled="true"
                  v-else-if="$check_field('get','merchant_users')" id="merchant_users"
                ></uni-data-select>
                  </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','food_name') || ($check_field('add','food_name') || $check_field('set','food_name'))" label="美食名称" name="food_name">
                            <uni-easyinput type="text" v-model="form['food_name']" v-if="user_group === '管理员' || (form['food_orders_id'] && $check_field('set','food_name')) || (!form['food_orders_id'] && $check_field('add','food_name'))" :disabled="disabledObj['food_name_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','food_name')">
                  {{ form['food_name'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','food_types') || ($check_field('add','food_types') || $check_field('set','food_types'))" label="美食类型" name="food_types">
                            <uni-easyinput type="text" v-model="form['food_types']" v-if="user_group === '管理员' || (form['food_orders_id'] && $check_field('set','food_types')) || (!form['food_orders_id'] && $check_field('add','food_types'))" :disabled="disabledObj['food_types_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','food_types')">
                  {{ form['food_types'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','food_prices') || ($check_field('add','food_prices') || $check_field('set','food_prices'))" label="美食价格" name="food_prices">
                            <uni-easyinput type="text" v-model="form['food_prices']" v-if="user_group === '管理员' || (form['food_orders_id'] && $check_field('set','food_prices')) || (!form['food_orders_id'] && $check_field('add','food_prices'))" :disabled="disabledObj['food_prices_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','food_prices')">
                  {{ form['food_prices'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','student_users') || ($check_field('add','student_users') || $check_field('set','student_users'))" label="学生用户" name="student_users">
                    <uni-data-select
                  id="form_student_users"
                  v-model="form['student_users']"
                  :localdata="list_user_student_users"
                  :clear="!disabledObj['student_users_isDisabled']"
                  :disabled="disabledObj['student_users_isDisabled']"
                  v-if="user_group === '管理员' || (form['food_orders_id'] && $check_field('set','student_users')) || (!form['food_orders_id'] && $check_field('add','student_users'))"
                ></uni-data-select>
                <uni-data-select
                  v-model="form['student_users']"
                  :localdata="list_user_student_users"
                  :clear="false"
                  :disabled="true"
                  v-else-if="$check_field('get','student_users')" id="student_users"
                ></uni-data-select>
                  </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','student_name') || ($check_field('add','student_name') || $check_field('set','student_name'))" label="学生姓名" name="student_name">
                            <uni-easyinput type="text" v-model="form['student_name']" v-if="user_group === '管理员' || (form['food_orders_id'] && $check_field('set','student_name')) || (!form['food_orders_id'] && $check_field('add','student_name'))" :disabled="disabledObj['student_name_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','student_name')">
                  {{ form['student_name'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','contact_number') || ($check_field('add','contact_number') || $check_field('set','contact_number'))" label="联系电话" name="contact_number">
                            <uni-easyinput type="text" v-model="form['contact_number']" v-if="user_group === '管理员' || (form['food_orders_id'] && $check_field('set','contact_number')) || (!form['food_orders_id'] && $check_field('add','contact_number'))" :disabled="disabledObj['contact_number_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','contact_number')">
                  {{ form['contact_number'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','shipping_address') || ($check_field('add','shipping_address') || $check_field('set','shipping_address'))" label="收货地址" name="shipping_address">
                            <uni-easyinput type="text" v-model="form['shipping_address']" v-if="user_group === '管理员' || (form['food_orders_id'] && $check_field('set','shipping_address')) || (!form['food_orders_id'] && $check_field('add','shipping_address'))" :disabled="disabledObj['shipping_address_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','shipping_address')">
                  {{ form['shipping_address'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','purchase_quantity') || ($check_field('add','purchase_quantity') || $check_field('set','purchase_quantity'))" label="购买数量" name="purchase_quantity">
                            <uni-easyinput type="text" v-model="form['purchase_quantity']" v-if="user_group === '管理员' || (form['food_orders_id'] && $check_field('set','purchase_quantity')) || (!form['food_orders_id'] && $check_field('add','purchase_quantity'))" :disabled="disabledObj['purchase_quantity_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','purchase_quantity')">
                  {{ form['purchase_quantity'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','total_purchase_price') || ($check_field('add','total_purchase_price') || $check_field('set','total_purchase_price'))" label="购买总价" name="total_purchase_price">
                            <uni-easyinput type="text" v-model="form['total_purchase_price']" v-if="user_group === '管理员' || (form['food_orders_id'] && $check_field('set','total_purchase_price')) || (!form['food_orders_id'] && $check_field('add','total_purchase_price'))"  @focus="set_total_purchase_price()" :disabled="disabledObj['total_purchase_price_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','total_purchase_price')">
                  {{ form['total_purchase_price'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','order_remarks') || ($check_field('add','order_remarks') || $check_field('set','order_remarks'))" label="订单备注" name="order_remarks">
                            <uni-easyinput type="text" v-model="form['order_remarks']" v-if="user_group === '管理员' || (form['food_orders_id'] && $check_field('set','order_remarks')) || (!form['food_orders_id'] && $check_field('add','order_remarks'))" :disabled="disabledObj['order_remarks_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','order_remarks')">
                  {{ form['order_remarks'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','order_status') || ($check_field('add','order_status') || $check_field('set','order_status'))" label="订单状态" name="order_status">
                    <uni-data-select
                  v-model="form.order_status"
                  :localdata="list_order_status"
                  :clear="!disabledObj['order_status_isDisabled']"
                  :disabled="disabledObj['order_status_isDisabled']"
                  v-if="user_group === '管理员' || (form['food_orders_id'] && $check_field('set','order_status')) || (!form['food_orders_id'] && $check_field('add','order_status'))"
                ></uni-data-select>
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','order_status')">
                  {{ form['order_status'] }}
                </text>
                  </uni-forms-item>


            </uni-forms>
            <view class="form_button">
              <button size="mini" type="primary" @click="submit()" class="primary_btn">提交</button>
              <button size="mini" @click="cancel()">取消</button>
            </view>
          </view>
        </view>
      </view>
    </view>
  </view>
</template>

<script>
import mixin from "@/libs/mixins/page.js";

export default {
  mixins: [mixin],
  data() {
    return {
      field: "food_orders_id",
      url_add: "~/api/food_orders/add?",
      url_set: "~/api/food_orders/set?",
      url_get_obj: "~/api/food_orders/get_obj?",
      url_upload: "~/api/food_orders/upload?",

      query: {
        "food_orders_id": 0,
      },

      form: {
            "order_number": this.$get_stamp(), // 订单编号
                    "store_name":  '', // 店铺名称
                    "merchant_users": 0, // 商家用户
                    "food_name":  '', // 美食名称
                    "food_types":  '', // 美食类型
                    "food_prices":  '', // 美食价格
                    "student_users": 0, // 学生用户
                    "student_name":  '', // 学生姓名
                    "contact_number":  '', // 联系电话
                    "shipping_address":  '', // 收货地址
                    "purchase_quantity":  0 , // 购买数量
                    "total_purchase_price":  '', // 购买总价
                    "order_remarks":  '', // 订单备注
                    "order_status":  '', // 订单状态
                                "food_orders_id": 0, // ID
                
              },
          disabledObj:{
                        "order_number_isDisabled": false,
                                "store_name_isDisabled": false,
                                "merchant_users_isDisabled": false,
                                "food_name_isDisabled": false,
                                "food_types_isDisabled": false,
                                "food_prices_isDisabled": false,
                                "student_users_isDisabled": false,
                                "student_name_isDisabled": false,
                                "contact_number_isDisabled": false,
                                "shipping_address_isDisabled": false,
                                                    "total_purchase_price_isDisabled": false,
                                "order_remarks_isDisabled": false,
                                "order_status_isDisabled": false,
                                  },
                                                                        // 用户列表
            list_user_merchant_users: [],
                                                                                                                // 用户列表
            list_user_student_users: [],
                        // 用户组
            group_user_student_users: "",
                                                                                                                                                                  // 订单状态选项列表
          list_order_status: [],
                                      }
  },
  methods: {
    changeLog(v,value){
      this.form[value] = v
    },
    /**
     * 上传文件
     * @param {Object} param文件参数
     */
    change_file(key_name){
      var _self = this;
      // 选择图像方法
      uni.chooseFile({
        count: 1,
        sizeType: ['original', 'compressed'], //可以指定是原图还是压缩图，默认二者都有
        sourceType: ['album'], //从相册选择
        success: function(res) {
          const tempFilePaths = res.tempFilePaths;
          const uploadTask = uni.uploadFile({
            url: _self.$fullUrl('/api/food_orders/upload?'),
            filePath: tempFilePaths[0],
            name: 'file',
            formData: {
              'i_want_to_customize': 'test'
            },
            header: {
              'x-auth-token': _self.$store.state.user.token
            },
            success: function(uploadFileRes) {
              var filename = JSON.parse(uploadFileRes.data).result.url
              _self.form[key_name] = filename
            }
          });

          uploadTask.onProgressUpdate(function(res) {
            _self.percent = res.progress;
            console.log('上传进度' + res.progress);
            console.log('已经上传的数据长度' + res.totalBytesSent);
            console.log('预期需要上传的数据总长度' + res.totalBytesExpectedToSend);
          });
        },
        error: function(e) {
          console.log(e);
        }
      });
    },
    /**
     * 上传图片
     * @param {Object} param文件参数
     */
    change_img(key_name){
      var _self = this;
      _self.upload_img_flag = false
      // 选择图像方法
      uni.chooseImage({
        count: 1,
        sizeType: ['original', 'compressed'], //可以指定是原图还是压缩图，默认二者都有
        sourceType: ['album'], //从相册选择
        success: function(res) {
          const tempFilePaths = res.tempFilePaths;
          const uploadTask = uni.uploadFile({
            url: _self.$fullUrl('/api/food_orders/upload?'),
            filePath: tempFilePaths[0],
            name: 'file',
            formData: {
              'i_want_to_customize': 'test'
            },
            header: {
              'x-auth-token': _self.$store.state.user.token
            },
            success: function(uploadFileRes) {
              var filename = JSON.parse(uploadFileRes.data).result.url
              _self.form[key_name] = filename
            }
          });

          uploadTask.onProgressUpdate(function(res) {
            _self.percent = res.progress;
            console.log('上传进度' + res.progress);
            console.log('已经上传的数据长度' + res.totalBytesSent);
            console.log('预期需要上传的数据总长度' + res.totalBytesExpectedToSend);
          });
        },
        error: function(e) {
          console.log(e);
        }
      });
    },
    /**
     * 获取对象后获取缓存表单
     * @param {Object} json
     * @param {Object} func
     */
    get_obj_before(param){
      var form = uni.db.get("form");
      if (form) {
        delete(form.examine_state)
        delete(form.examine_reply)
        this.obj = uni.push(this.obj ,form);
        this.form = uni.push(this.form ,form);
      }
      var arr = []
      for (let key in form) {
        arr.push(key)
      }
      for (var i=0;i<arr.length;i++){
        this.disabledObj[arr[i] + '_isDisabled'] = true
      }
                                                                                                                      uni.db.del("form");
      return param;
    },
        
            
                /**
     * 获取商家用户用户列表
     */
    async get_list_user_merchant_users() {
      // if(this.user_group !== "管理员" && this.form["merchant_users"] === 0) {
      //     this.form["merchant_users"] = this.user.user_id;
      // }
      var json = await this.$get("~/api/user/get_list?user_group=商家用户");
      if(json.result && json.result.list){
        json.result.list.map((o) => this.list_user_merchant_users.push({value:o.user_id,text:o.nickname + '-' + o.username}));
      }
      else if(json.error){
        console.error(json.error);
      }
    },
            
            
            
            
                /**
     * 获取学生用户用户列表
     */
    async get_list_user_student_users() {
      // if(this.user_group !== "管理员" && this.form["student_users"] === 0) {
      //     this.form["student_users"] = this.user.user_id;
      // }
      var json = await this.$get("~/api/user/get_list?user_group=学生用户");
      if(json.result && json.result.list){
        json.result.list.map((o) => this.list_user_student_users.push({value:o.user_id,text:o.nickname + '-' + o.username}));
      }
      else if(json.error){
        console.error(json.error);
      }
    },
            /**
     * 获取学生用户用户组
     */
    async get_group_user_student_users() {
      this.form["student_users"] = this.user.user_id;
      var json = await this.$get("~/api/user_group/get_obj?name=学生用户");
      if(json.result && json.result.obj){
        this.group_user_student_users = json.result.obj;
        this.get_user_session_student_users(this.form['student_users'])
      }
      else if(json.error){
        console.error(json.error);
      }
    },
    get_user_session_student_users(id){
      var _this = this;
      var user_id = {"user_id":id}
      var url = "~/api/"+_this.group_user_student_users.source_table+"/get_obj?"
      this.$get(url, user_id, function(res) {
        if (res.result && res.result.obj) {
          var arr = []
          for (let key in res.result.obj) {
            arr.push(key)
          }
          var arrForm = []
          for (let key in _this.form) {
            arrForm.push(key)
          }
          for (var i=0;i<arr.length;i++){
            if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
              for (var j = 0; j < arrForm.length; j++) {
                if (arr[i] === arrForm[j]) {
                  if (arr[i] !== "student_users") {
                    _this.form[arrForm[j]] = res.result.obj[arr[i]]
                    _this.disabledObj[arrForm[j] + '_isDisabled'] = true
                    break;
                  } else {
                    _this.disabledObj[arrForm[j] + '_isDisabled'] = true
                  }
                }
              }
            }
          }
        }
      });
    },
            
            
            
            
            
            
                            set_total_purchase_price(){
      this.form.total_purchase_price = parseFloat(this.form.food_prices) * parseFloat(this.form.purchase_quantity)
      let r = /^\+?[1-9][0-9]*$/; // 正整数
      if(!r.test(this.form.total_purchase_price) ){
        this.form.total_purchase_price = this.form.total_purchase_price.toFixed(2);
      }
    },
                                
            /**
     * 获取订单状态列表
     */
    async get_list_order_status() {
          ['配餐中','配送中','已完成'].map((o) => this.list_order_status.push({value:o,text:o}));
            },
        
    
    /**
     * 获取对象之后
     * @param {Object} json
     * @param {Object} func
     */
    get_obj_after(json, func){
                                                                                                                    },

    is_view(){
      var bl = this.user_group == "管理员";

      if(!bl){
        bl = this.$check_action('/food_orders/table','add');
        console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
      }
      if(!bl){
        bl = this.$check_action('/food_orders/table','set');
        console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
      }
      if(!bl){
        bl = this.$check_action('/food_orders/view','add');
        console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
      }
      if(!bl){
        bl = this.$check_action('/food_orders/view','set');
        console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
      }
      if(!bl){
        bl = this.$check_action('/food_orders/view','get');
        console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
      }

      console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

      return bl;
    },

  },
  created() {
                            this.get_list_user_merchant_users();
                                                this.get_list_user_student_users();
            this.get_group_user_student_users();
                                                                    this.get_list_order_status();
          },
}
</script>

<style scoped>
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}

.avatar-uploader .el-upload:hover {
  border-color: #409EFF;
}

.form_button{
  padding-bottom: 15px;
  display: flex;
}
.form_button button{
  width: 40%;
}
.query_select{
  border-color: rgb(229, 229, 229);
  background-color: rgb(255, 255, 255);
  border-radius: 4px;
  box-sizing: border-box;
  flex: 1;
  width: 100%;
  line-height: 2;
  font-size: 14px;
  height: 2.4em;
  min-height: 2.4em;
  display: block;
  outline:none;
}

.query_option{
  width: 100%;
}

.btn_add_img{
  color: #D3D3D3;
  text-align: center;
  border: 1px solid #eee;
  height: 5rem;
  width: 5rem;
  position: relative;
}
.btn_add_img text{
  font-size: 35px;
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%,-50%);
}
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}

.avatar-uploader .el-upload:hover {
  border-color: #409eff;
}

.form_button {
  padding-bottom: 15px;
  display: flex;
}
.form_button button {
  width: 40%;
}
.query_select {
  border-color: rgb(229, 229, 229);
  background-color: rgb(255, 255, 255);
  border-radius: 4px;
  box-sizing: border-box;
  flex: 1;
  width: 100%;
  line-height: 2;
  font-size: 14px;
  height: 2.4em;
  min-height: 2.4em;
  display: block;
  outline: none;
}

.query_option {
  width: 100%;
}

.btn_add_img {
  color: #d3d3d3;
  text-align: center;
  border: 1px solid #eee;
  height: 5rem;
  width: 5rem;
  position: relative;
}
.btn_add_img text {
  font-size: 35px;
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
}
/*新样式*/
.uni-forms{
padding-top:1rem;
}
.uni-forms-item {
	padding: 6px 10px;
    background: #f8f6fc;
}
.uni-forms .is-input-border{
	border: 0;
}
.container{
	    -webkit-box-shadow: 0px 0px 0px #888888;
	    box-shadow: 0px 0px 0px #888888;
}
.form_button .primary_btn{
		background-color: #22B8B8;
		color: #FFFFFF;
	}
</style>
