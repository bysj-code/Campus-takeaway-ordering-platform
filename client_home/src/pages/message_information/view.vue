<template>
  <view>
    <view class="container diy_view">
      <view>
        <view>
          <view class="">
            <uni-forms :modelValue="form"  v-if="is_view()">

              <uni-forms-item v-if="$check_field('get','order_number') || ($check_field('add','order_number') || $check_field('set','order_number'))" label="订单编号" name="order_number">
                            <uni-easyinput type="text" v-model="form['order_number']" v-if="user_group === '管理员' || (form['message_information_id'] && $check_field('set','order_number')) || (!form['message_information_id'] && $check_field('add','order_number'))" :disabled="disabledObj['order_number_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','order_number')">
                  {{ form['order_number'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','store_name') || ($check_field('add','store_name') || $check_field('set','store_name'))" label="店铺名称" name="store_name">
                            <uni-easyinput type="text" v-model="form['store_name']" v-if="user_group === '管理员' || (form['message_information_id'] && $check_field('set','store_name')) || (!form['message_information_id'] && $check_field('add','store_name'))" :disabled="disabledObj['store_name_isDisabled']" />
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
                  v-if="user_group === '管理员' || (form['message_information_id'] && $check_field('set','merchant_users')) || (!form['message_information_id'] && $check_field('add','merchant_users'))"
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
                            <uni-easyinput type="text" v-model="form['food_name']" v-if="user_group === '管理员' || (form['message_information_id'] && $check_field('set','food_name')) || (!form['message_information_id'] && $check_field('add','food_name'))" :disabled="disabledObj['food_name_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','food_name')">
                  {{ form['food_name'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','student_users') || ($check_field('add','student_users') || $check_field('set','student_users'))" label="学生用户" name="student_users">
                    <uni-data-select
                  id="form_student_users"
                  v-model="form['student_users']"
                  :localdata="list_user_student_users"
                  :clear="!disabledObj['student_users_isDisabled']"
                  :disabled="disabledObj['student_users_isDisabled']"
                  v-if="user_group === '管理员' || (form['message_information_id'] && $check_field('set','student_users')) || (!form['message_information_id'] && $check_field('add','student_users'))"
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
                            <uni-easyinput type="text" v-model="form['student_name']" v-if="user_group === '管理员' || (form['message_information_id'] && $check_field('set','student_name')) || (!form['message_information_id'] && $check_field('add','student_name'))" :disabled="disabledObj['student_name_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','student_name')">
                  {{ form['student_name'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','contact_number') || ($check_field('add','contact_number') || $check_field('set','contact_number'))" label="联系电话" name="contact_number">
                            <uni-easyinput type="text" v-model="form['contact_number']" v-if="user_group === '管理员' || (form['message_information_id'] && $check_field('set','contact_number')) || (!form['message_information_id'] && $check_field('add','contact_number'))" :disabled="disabledObj['contact_number_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','contact_number')">
                  {{ form['contact_number'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','shipping_address') || ($check_field('add','shipping_address') || $check_field('set','shipping_address'))" label="收货地址" name="shipping_address">
                            <uni-easyinput type="text" v-model="form['shipping_address']" v-if="user_group === '管理员' || (form['message_information_id'] && $check_field('set','shipping_address')) || (!form['message_information_id'] && $check_field('add','shipping_address'))" :disabled="disabledObj['shipping_address_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','shipping_address')">
                  {{ form['shipping_address'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','purchase_quantity') || ($check_field('add','purchase_quantity') || $check_field('set','purchase_quantity'))" label="购买数量" name="purchase_quantity">
                            <uni-easyinput type="text" v-model="form['purchase_quantity']" v-if="user_group === '管理员' || (form['message_information_id'] && $check_field('set','purchase_quantity')) || (!form['message_information_id'] && $check_field('add','purchase_quantity'))" :disabled="disabledObj['purchase_quantity_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','purchase_quantity')">
                  {{ form['purchase_quantity'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','delivery_users') || ($check_field('add','delivery_users') || $check_field('set','delivery_users'))" label="配送用户" name="delivery_users">
                    <uni-data-select
                  id="form_delivery_users"
                  v-model="form['delivery_users']"
                  :localdata="list_user_delivery_users"
                  :clear="!disabledObj['delivery_users_isDisabled']"
                  :disabled="disabledObj['delivery_users_isDisabled']"
                  v-if="user_group === '管理员' || (form['message_information_id'] && $check_field('set','delivery_users')) || (!form['message_information_id'] && $check_field('add','delivery_users'))"
                ></uni-data-select>
                <uni-data-select
                  v-model="form['delivery_users']"
                  :localdata="list_user_delivery_users"
                  :clear="false"
                  :disabled="true"
                  v-else-if="$check_field('get','delivery_users')" id="delivery_users"
                ></uni-data-select>
                  </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','message_content') || ($check_field('add','message_content') || $check_field('set','message_content'))" label="留言内容" name="message_content">
                    <uni-easyinput type="textarea" v-model="form['message_content']" v-if="user_group === '管理员' || (form['message_information_id'] && $check_field('set','message_content')) || (!form['message_information_id'] && $check_field('add','message_content'))" :disabled="disabledObj['message_content_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','message_content')">
                  {{ form['message_content'] }}
                </text>
                  </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','reply_content') || ($check_field('add','reply_content') || $check_field('set','reply_content'))" label="回复内容" name="reply_content">
                    <uni-easyinput type="textarea" v-model="form['reply_content']" v-if="user_group === '管理员' || (form['message_information_id'] && $check_field('set','reply_content')) || (!form['message_information_id'] && $check_field('add','reply_content'))" :disabled="disabledObj['reply_content_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','reply_content')">
                  {{ form['reply_content'] }}
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
      field: "message_information_id",
      url_add: "~/api/message_information/add?",
      url_set: "~/api/message_information/set?",
      url_get_obj: "~/api/message_information/get_obj?",
      url_upload: "~/api/message_information/upload?",

      query: {
        "message_information_id": 0,
      },

      form: {
            "order_number":  '', // 订单编号
                    "store_name":  '', // 店铺名称
                    "merchant_users": 0, // 商家用户
                    "food_name":  '', // 美食名称
                    "student_users": 0, // 学生用户
                    "student_name":  '', // 学生姓名
                    "contact_number":  '', // 联系电话
                    "shipping_address":  '', // 收货地址
                    "purchase_quantity":  '', // 购买数量
                    "delivery_users": 0, // 配送用户
                    "message_content":  '', // 留言内容
                    "reply_content":  '', // 回复内容
                                "message_information_id": 0, // ID
                
              },
          disabledObj:{
                        "order_number_isDisabled": false,
                                "store_name_isDisabled": false,
                                "merchant_users_isDisabled": false,
                                "food_name_isDisabled": false,
                                "student_users_isDisabled": false,
                                "student_name_isDisabled": false,
                                "contact_number_isDisabled": false,
                                "shipping_address_isDisabled": false,
                                "purchase_quantity_isDisabled": false,
                                "delivery_users_isDisabled": false,
                                "message_content_isDisabled": false,
                                "reply_content_isDisabled": false,
                                  },
                                                                        // 用户列表
            list_user_merchant_users: [],
                                                                        // 用户列表
            list_user_student_users: [],
                                                                                                                                    // 用户列表
            list_user_delivery_users: [],
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
            url: _self.$fullUrl('/api/message_information/upload?'),
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
            url: _self.$fullUrl('/api/message_information/upload?'),
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
     * 获取配送用户用户列表
     */
    async get_list_user_delivery_users() {
      // if(this.user_group !== "管理员" && this.form["delivery_users"] === 0) {
      //     this.form["delivery_users"] = this.user.user_id;
      // }
      var json = await this.$get("~/api/user/get_list?user_group=配送用户");
      if(json.result && json.result.list){
        json.result.list.map((o) => this.list_user_delivery_users.push({value:o.user_id,text:o.nickname + '-' + o.username}));
      }
      else if(json.error){
        console.error(json.error);
      }
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
        bl = this.$check_action('/message_information/table','add');
        console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
      }
      if(!bl){
        bl = this.$check_action('/message_information/table','set');
        console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
      }
      if(!bl){
        bl = this.$check_action('/message_information/view','add');
        console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
      }
      if(!bl){
        bl = this.$check_action('/message_information/view','set');
        console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
      }
      if(!bl){
        bl = this.$check_action('/message_information/view','get');
        console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
      }

      console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

      return bl;
    },

  },
  created() {
                            this.get_list_user_merchant_users();
                                this.get_list_user_student_users();
                                                        this.get_list_user_delivery_users();
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
