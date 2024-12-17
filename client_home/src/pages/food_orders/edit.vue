<template>
	<view class="diy_edit page_food_orders" id="food_orders_edit">
		<view class='warp'>
			<view class='container'>
				<view class='row'>
						<view v-if="$check_field('set','order_number') || $check_field('add','order_number') || $check_field('get','order_number')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								订单编号:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_order_number" v-model="form['order_number']" placeholder="请输入订单编号" v-if="(form['order_number'] && $check_field('set','order_number')) || (!form['order_number'] && $check_field('add','order_number'))" :disabled="true" />
							<text v-else-if="$check_field('get','order_number')">{{ form['order_number'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','store_name') || $check_field('add','store_name') || $check_field('get','store_name')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								店铺名称:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_store_name" v-model="form['store_name']" placeholder="请输入店铺名称" v-if="(form['store_name'] && $check_field('set','store_name')) || (!form['store_name'] && $check_field('add','store_name'))" :disabled="disabledObj['store_name_isDisabled']" />
							<text v-else-if="$check_field('get','store_name')">{{ form['store_name'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','merchant_users') || $check_field('add','merchant_users') || $check_field('get','merchant_users')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								商家用户:
							</text>
						</view>
						<view class="diy_field diy_down diy_text_row diy_select_flex">
							<uni-data-select
									id="form_merchant_users"
									v-model="form['merchant_users']"
									:localdata="list_user_merchant_users"
									:clear="!disabledObj['merchant_users_isDisabled']"
									:disabled="disabledObj['merchant_users_isDisabled']"
									v-if="(form['merchant_users'] && $check_field('set','merchant_users')) || (!form['merchant_users'] && $check_field('add','merchant_users'))"
							></uni-data-select>
							<text v-else-if="$check_field('get','merchant_users')">{{ form['merchant_users'] }}</text>
						</view>
					</view>
							<view v-if="$check_field('set','food_name') || $check_field('add','food_name') || $check_field('get','food_name')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								美食名称:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_food_name" v-model="form['food_name']" placeholder="请输入美食名称" v-if="(form['food_name'] && $check_field('set','food_name')) || (!form['food_name'] && $check_field('add','food_name'))" :disabled="disabledObj['food_name_isDisabled']" />
							<text v-else-if="$check_field('get','food_name')">{{ form['food_name'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','food_types') || $check_field('add','food_types') || $check_field('get','food_types')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								美食类型:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_food_types" v-model="form['food_types']" placeholder="请输入美食类型" v-if="(form['food_types'] && $check_field('set','food_types')) || (!form['food_types'] && $check_field('add','food_types'))" :disabled="disabledObj['food_types_isDisabled']" />
							<text v-else-if="$check_field('get','food_types')">{{ form['food_types'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','food_prices') || $check_field('add','food_prices') || $check_field('get','food_prices')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								美食价格:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_food_prices" v-model="form['food_prices']" placeholder="请输入美食价格" v-if="(form['food_prices'] && $check_field('set','food_prices')) || (!form['food_prices'] && $check_field('add','food_prices'))" :disabled="disabledObj['food_prices_isDisabled']" />
							<text v-else-if="$check_field('get','food_prices')">{{ form['food_prices'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','student_users') || $check_field('add','student_users') || $check_field('get','student_users')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								学生用户:
							</text>
						</view>
						<view class="diy_field diy_down diy_text_row diy_select_flex">
							<uni-data-select
									id="form_student_users"
									v-model="form['student_users']"
									:localdata="list_user_student_users"
									:clear="!disabledObj['student_users_isDisabled']"
									:disabled="disabledObj['student_users_isDisabled']"
									v-if="(form['student_users'] && $check_field('set','student_users')) || (!form['student_users'] && $check_field('add','student_users'))"
							></uni-data-select>
							<text v-else-if="$check_field('get','student_users')">{{ form['student_users'] }}</text>
						</view>
					</view>
							<view v-if="$check_field('set','student_name') || $check_field('add','student_name') || $check_field('get','student_name')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								学生姓名:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_student_name" v-model="form['student_name']" placeholder="请输入学生姓名" v-if="(form['student_name'] && $check_field('set','student_name')) || (!form['student_name'] && $check_field('add','student_name'))" :disabled="disabledObj['student_name_isDisabled']" />
							<text v-else-if="$check_field('get','student_name')">{{ form['student_name'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','contact_number') || $check_field('add','contact_number') || $check_field('get','contact_number')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								联系电话:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_contact_number" v-model="form['contact_number']" placeholder="请输入联系电话" v-if="(form['contact_number'] && $check_field('set','contact_number')) || (!form['contact_number'] && $check_field('add','contact_number'))" :disabled="disabledObj['contact_number_isDisabled']" />
							<text v-else-if="$check_field('get','contact_number')">{{ form['contact_number'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','shipping_address') || $check_field('add','shipping_address') || $check_field('get','shipping_address')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								收货地址:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_shipping_address" v-model="form['shipping_address']" placeholder="请输入收货地址" v-if="(form['shipping_address'] && $check_field('set','shipping_address')) || (!form['shipping_address'] && $check_field('add','shipping_address'))" :disabled="disabledObj['shipping_address_isDisabled']" />
							<text v-else-if="$check_field('get','shipping_address')">{{ form['shipping_address'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','purchase_quantity') || $check_field('add','purchase_quantity') || $check_field('get','purchase_quantity')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								购买数量:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_purchase_quantity" v-model="form['purchase_quantity']" placeholder="请输入购买数量" v-if="(form['purchase_quantity'] && $check_field('set','purchase_quantity')) || (!form['purchase_quantity'] && $check_field('add','purchase_quantity'))" :disabled="disabledObj['purchase_quantity_isDisabled']" />
							<text v-else-if="$check_field('get','purchase_quantity')">{{ form['purchase_quantity'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','total_purchase_price') || $check_field('add','total_purchase_price') || $check_field('get','total_purchase_price')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								购买总价:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_total_purchase_price" v-model="form['total_purchase_price']" placeholder="请输入购买总价" v-if="(form['total_purchase_price'] && $check_field('set','total_purchase_price')) || (!form['total_purchase_price'] && $check_field('add','total_purchase_price'))" @focus="set_total_purchase_price()" :disabled="disabledObj['total_purchase_price_isDisabled']" />
							<text v-else-if="$check_field('get','total_purchase_price')">{{ form['total_purchase_price'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','order_remarks') || $check_field('add','order_remarks') || $check_field('get','order_remarks')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								订单备注:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_order_remarks" v-model="form['order_remarks']" placeholder="请输入订单备注" v-if="(form['order_remarks'] && $check_field('set','order_remarks')) || (!form['order_remarks'] && $check_field('add','order_remarks'))" :disabled="disabledObj['order_remarks_isDisabled']" />
							<text v-else-if="$check_field('get','order_remarks')">{{ form['order_remarks'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','order_status') || $check_field('add','order_status') || $check_field('get','order_status')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								订单状态:
							</text>
						</view>
								<!-- 选项 -->
						<view class="diy_field diy_down diy_text_row diy_select_flex">
							<uni-data-select
									id="form_order_status"
									v-model="form['order_status']"
									:localdata="list_order_status"
									v-if="(form['order_status'] && $check_field('set','order_status')) || (!form['order_status'] && $check_field('add','order_status'))"
							></uni-data-select>
							<text v-else-if="$check_field('get','order_status')">{{ form['order_status'] }}</text>
						</view>
							</view>
	
				</view>
				<view class="row">
					<view class="col-12">
						<view class="btn_box">
							<button class="btn_submit primary_btn" @click="submit()">提交</button>
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
	mixins:[mixin],
	components:{},
	data(){
		return{
			url_get_obj:"~/api/food_orders/get_obj?",
			url_add:"~/api/food_orders/add?",
			url_set:"~/api/food_orders/set?",

			// 登录权限
			oauth: {
				"signIn": true,
				"user_group": []
			},

			// 查询条件
			query: {
					"order_number": "",
						"store_name": "",
						"merchant_users": 0,
						"food_name": "",
						"food_types": "",
						"food_prices": "",
						"student_users": 0,
						"student_name": "",
						"contact_number": "",
						"shipping_address": "",
						"purchase_quantity": 0,
						"total_purchase_price": "",
						"order_remarks": "",
						"order_status": "",
					"food_orders_id": 0
			},

			obj: {
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
					"food_orders_id": 0,

			},

			// 表单字段
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
					"food_orders_id": 0,
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
																	list_order_status: [],
		
			field:"food_orders_id",
			table_key:"food_orders",

		}
	},
	methods: {
			
	
				
	
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
				async get_user_session_student_users(){
			var _this = this;
			var json = await this.$get("~/api/user_group/get_obj?name=学生用户");
			if(json.result && json.result.obj){
				var source_table = json.result.obj.source_table;
				var user_id = _this.$store.state.user.user_id;
				if (user_id){
					var url = "~/api/"+source_table+"/get_obj?"
					this.$get(url, {"user_id":_this.$store.state.user.user_id}, function(res) {
						if (res.result && res.result.obj) {
							var arr = []
							for (let key in res.result.obj) {
								arr.push(key)
							}
							var arrForm = []
							for (let key in _this.form) {
								arrForm.push(key)
							}
							_this.form["student_users"] = user_id
							_this.disabledObj['student_users' + '_isDisabled'] = true
							for (var i=0;i<arr.length;i++){
                if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
                  for (var j = 0; j < arrForm.length; j++) {
                    if (arr[i] === arrForm[j]) {
                      if (arr[i] !== "student_users") {
                        _this.form[arrForm[j]] = res.result.obj[arr[i]]
                        _this.disabledObj[arrForm[j] + '_isDisabled'] = true
                        break;
                      }
                    }
                  }
                }
							}
						}
					});
				}
			}
			else if(json.error){
				console.error(json.error);
			}
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
			
	
			change_file(key_name){
			var _self = this;
				this.$chooseFile().then(res=>{
					console.log(res)

						const uploadTask = uni.uploadFile({
							url: _self.$fullUrl("/api/feedback/upload?"),
							filePath: res[0].path,
							name: "file",
							formData: {
								i_want_to_customize: "test",
							},
							header: {
								"x-auth-token": _self.$store.state.user.token,
							},
							success: function(uploadFileRes) {
								console.log(uploadFileRes)
								var filename = JSON.parse(uploadFileRes.data).result.url;
								_self.form[key_name] = filename;
							},
						});

						uploadTask.onProgressUpdate(function(res) {
							_self.percent = res.progress;
							console.log("上传进度" + res.progress);
							console.log("已经上传的数据长度" + res.totalBytesSent);
							console.log(
								"预期需要上传的数据总长度" + res.totalBytesExpectedToSend
							);
						});

				})
		},
		change_img(key_name) {
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
							'food_orders': 'test'
						},
						header: {
							'x-auth-token': _self.$store.state.user.token
						},
						success: function(uploadFileRes) {
							var filename = JSON.parse(uploadFileRes.data).result.url
							var img_url = filename
							_self.form[key_name] = img_url
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
		 * 获取对象后获取缓存表单
		 * @param {Object} json
		 * @param {Object} func
		 */
		get_obj_after(json ,func){
			var form = uni.db.get("form");
			var obj = Object.assign({} ,form ,this.obj);
			if (form) {
				this.obj = uni.push(this.obj ,obj);
			}
			if (form) {
				this.form = uni.push(this.form ,form);
			}
			if(func){
				func(json);
			}
		},

	},
	onLoad(){
											this.get_list_user_merchant_users();
														this.get_user_session_student_users();
				this.get_list_user_student_users();
																						this.get_list_order_status();
				},
}
</script>

<style scoped>
	input{
		font-size: 10px;
	}

	.form_edit {
		background-color: #fff;
		margin-bottom: 0.5rem;
		padding: 1rem;
		font-size: 10px;
	}

	.item {
		display: flex;
		padding: 0.2rem 0;
	}

	.left_text {
		flex: 0 0 25%;
		display: flex;
		align-items: center;
	}

	.right_text {
		flex: 0 0 75%;
		border-bottom: 1px solid #eee;
	}
	.right_text.btn_warp{
		border-bottom: 0;
	}

	.btn_submit {
		text-align: center;
		background-color: #fff;
		padding: 0.3rem;
		margin: 0.1rem 1rem;
		border: 1px solid #eee;
		border-radius: 0.5rem;
	}

	.btn_submit:hover {
		opacity: 0.5;
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




</style>
<style scoped>
/*新样式*/
.diy_text_row {
  display: inline-block;
}
.container {
	margin-top:1rem ;
	padding: 1rem;
    -webkit-box-shadow: 0px 0px 0px #888888;
    box-shadow: 0px 0px 0px #888888;
}
.primary_btn{
		background-color: #22B8B8;
		color: #FFFFFF;
	}
	.btn_submit{
		padding: 0;
		margin-top:1rem ;
	}
	.row-item {
		padding: 10px 10px;
	    background: #f8f6fc;
		margin-bottom: 1rem;
	}
	.diy_field{
		padding-left: 1rem;
	}
	.diy_title{
		align-items: center;
        font-size: 14px;
        color: #333;
	}

	.row-item{
		display: flex !important;
		align-items: baseline;
	}
	.diy_select_flex{
		flex: 1;
	}
	.query_select{
		flex: 1;
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
</style>

