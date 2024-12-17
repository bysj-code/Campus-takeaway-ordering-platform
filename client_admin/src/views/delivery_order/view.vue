<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','order_number') || $check_field('add','order_number') || $check_field('set','order_number')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="订单编号" prop="order_number">
												<el-input id="order_number" v-model="form['order_number']" placeholder="请输入订单编号"
							  v-if="user_group === '管理员' || (form['delivery_order_id'] && $check_field('set','order_number')) || (!form['delivery_order_id'] && $check_field('add','order_number'))" :disabled="disabledObj['order_number_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','order_number')">{{form['order_number']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','store_name') || $check_field('add','store_name') || $check_field('set','store_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="店铺名称" prop="store_name">
												<el-input id="store_name" v-model="form['store_name']" placeholder="请输入店铺名称"
							  v-if="user_group === '管理员' || (form['delivery_order_id'] && $check_field('set','store_name')) || (!form['delivery_order_id'] && $check_field('add','store_name'))" :disabled="disabledObj['store_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','store_name')">{{form['store_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','merchant_users') || $check_field('add','merchant_users') || $check_field('set','merchant_users')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="商家用户" prop="merchant_users">
													<el-select v-if="user_group === '管理员' || (form['delivery_order_id'] && $check_field('set','merchant_users')) || (!form['delivery_order_id'] && $check_field('add','merchant_users'))" id="merchant_users" v-model="form['merchant_users']" :disabled="disabledObj['merchant_users_isDisabled']">
							<el-option v-for="o in list_user_merchant_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
						<el-select v-else-if="$check_field('get','merchant_users')" id="merchant_users" v-model="form['merchant_users']" :disabled="true">
							<el-option v-for="o in list_user_merchant_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','food_name') || $check_field('add','food_name') || $check_field('set','food_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="美食名称" prop="food_name">
												<el-input id="food_name" v-model="form['food_name']" placeholder="请输入美食名称"
							  v-if="user_group === '管理员' || (form['delivery_order_id'] && $check_field('set','food_name')) || (!form['delivery_order_id'] && $check_field('add','food_name'))" :disabled="disabledObj['food_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','food_name')">{{form['food_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','food_types') || $check_field('add','food_types') || $check_field('set','food_types')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="美食类型" prop="food_types">
												<el-input id="food_types" v-model="form['food_types']" placeholder="请输入美食类型"
							  v-if="user_group === '管理员' || (form['delivery_order_id'] && $check_field('set','food_types')) || (!form['delivery_order_id'] && $check_field('add','food_types'))" :disabled="disabledObj['food_types_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','food_types')">{{form['food_types']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','food_prices') || $check_field('add','food_prices') || $check_field('set','food_prices')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="美食价格" prop="food_prices">
												<el-input id="food_prices" v-model="form['food_prices']" placeholder="请输入美食价格"
							  v-if="user_group === '管理员' || (form['delivery_order_id'] && $check_field('set','food_prices')) || (!form['delivery_order_id'] && $check_field('add','food_prices'))" :disabled="disabledObj['food_prices_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','food_prices')">{{form['food_prices']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','student_users') || $check_field('add','student_users') || $check_field('set','student_users')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="学生用户" prop="student_users">
													<el-select v-if="user_group === '管理员' || (form['delivery_order_id'] && $check_field('set','student_users')) || (!form['delivery_order_id'] && $check_field('add','student_users'))" id="student_users" v-model="form['student_users']" :disabled="disabledObj['student_users_isDisabled']">
							<el-option v-for="o in list_user_student_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
						<el-select v-else-if="$check_field('get','student_users')" id="student_users" v-model="form['student_users']" :disabled="true">
							<el-option v-for="o in list_user_student_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','student_name') || $check_field('add','student_name') || $check_field('set','student_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="学生姓名" prop="student_name">
												<el-input id="student_name" v-model="form['student_name']" placeholder="请输入学生姓名"
							  v-if="user_group === '管理员' || (form['delivery_order_id'] && $check_field('set','student_name')) || (!form['delivery_order_id'] && $check_field('add','student_name'))" :disabled="disabledObj['student_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','student_name')">{{form['student_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','contact_number') || $check_field('add','contact_number') || $check_field('set','contact_number')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="联系电话" prop="contact_number">
												<el-input id="contact_number" v-model="form['contact_number']" placeholder="请输入联系电话"
							  v-if="user_group === '管理员' || (form['delivery_order_id'] && $check_field('set','contact_number')) || (!form['delivery_order_id'] && $check_field('add','contact_number'))" :disabled="disabledObj['contact_number_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','contact_number')">{{form['contact_number']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','shipping_address') || $check_field('add','shipping_address') || $check_field('set','shipping_address')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="收货地址" prop="shipping_address">
												<el-input id="shipping_address" v-model="form['shipping_address']" placeholder="请输入收货地址"
							  v-if="user_group === '管理员' || (form['delivery_order_id'] && $check_field('set','shipping_address')) || (!form['delivery_order_id'] && $check_field('add','shipping_address'))" :disabled="disabledObj['shipping_address_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','shipping_address')">{{form['shipping_address']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','purchase_quantity') || $check_field('add','purchase_quantity') || $check_field('set','purchase_quantity')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="购买数量" prop="purchase_quantity">
												<el-input id="purchase_quantity" v-model="form['purchase_quantity']" placeholder="请输入购买数量"
							  v-if="user_group === '管理员' || (form['delivery_order_id'] && $check_field('set','purchase_quantity')) || (!form['delivery_order_id'] && $check_field('add','purchase_quantity'))" :disabled="disabledObj['purchase_quantity_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','purchase_quantity')">{{form['purchase_quantity']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','delivery_users') || $check_field('add','delivery_users') || $check_field('set','delivery_users')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="配送用户" prop="delivery_users">
													<el-select v-if="user_group === '管理员' || (form['delivery_order_id'] && $check_field('set','delivery_users')) || (!form['delivery_order_id'] && $check_field('add','delivery_users'))" id="delivery_users" v-model="form['delivery_users']" :disabled="disabledObj['delivery_users_isDisabled']">
							<el-option v-for="o in list_user_delivery_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
						<el-select v-else-if="$check_field('get','delivery_users')" id="delivery_users" v-model="form['delivery_users']" :disabled="true">
							<el-option v-for="o in list_user_delivery_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','delivery_status') || $check_field('add','delivery_status') || $check_field('set','delivery_status')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="配送状态" prop="delivery_status">
								<el-select id="delivery_status" v-model="form['delivery_status']"
						v-if="user_group === '管理员' || (form['delivery_order_id'] && $check_field('set','delivery_status')) || (!form['delivery_order_id'] && $check_field('add','delivery_status'))">
						<el-option v-for="o in list_delivery_status" :key="o" :label="o" :value="o">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','delivery_status')">{{form['delivery_status']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','delivery_description') || $check_field('add','delivery_description') || $check_field('set','delivery_description')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="配送描述" prop="delivery_description">
								<el-input type="textarea" id="delivery_description" v-model="form['delivery_description']" placeholder="请输入配送描述"
						v-if="user_group === '管理员' || (form['delivery_order_id'] && $check_field('set','delivery_description')) || (!form['delivery_order_id'] && $check_field('add','delivery_description'))" :disabled="disabledObj['delivery_description_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','delivery_description')">{{form['delivery_description']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','receiving_status') || $check_field('add','receiving_status') || $check_field('set','receiving_status')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="收货状态" prop="receiving_status">
								<el-select id="receiving_status" v-model="form['receiving_status']"
						v-if="user_group === '管理员' || (form['delivery_order_id'] && $check_field('set','receiving_status')) || (!form['delivery_order_id'] && $check_field('add','receiving_status'))">
						<el-option v-for="o in list_receiving_status" :key="o" :label="o" :value="o">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','receiving_status')">{{form['receiving_status']}}</div>
							</el-form-item>
			</el-col>
					
	
	
	
	
	
	
			<el-col :xs="24" :sm="12" :lg="8" class="el_form_btn_warp">
				<el-form-item>
					<el-button type="primary" @click="submit()">提交</el-button>
					<el-button @click="cancel()">取消</el-button>
				</el-form-item>
			</el-col>

		</el-form>
	</el-main>
</template>

<script>
	import mixin from "@/mixins/page.js";

	export default {
		mixins: [mixin],
		data() {
			return {
				field: "delivery_order_id",
				url_add: "~/api/delivery_order/add?",
				url_set: "~/api/delivery_order/set?",
				url_get_obj: "~/api/delivery_order/get_obj?",
				url_upload: "~/api/delivery_order/upload?",

				query: {
					"delivery_order_id": 0,
				},

				form: {
								"order_number":  '', // 订单编号
										"store_name":  '', // 店铺名称
										"merchant_users": 0, // 商家用户
										"food_name":  '', // 美食名称
										"food_types":  '', // 美食类型
										"food_prices":  '', // 美食价格
										"student_users": 0, // 学生用户
										"student_name":  '', // 学生姓名
										"contact_number":  '', // 联系电话
										"shipping_address":  '', // 收货地址
										"purchase_quantity":  '', // 购买数量
										"delivery_users": 0, // 配送用户
										"delivery_status":  '', // 配送状态
										"delivery_description":  '', // 配送描述
										"receiving_status":  '', // 收货状态
											"delivery_order_id": 0, // ID
						
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
										"purchase_quantity_isDisabled": false,
										"delivery_users_isDisabled": false,
										"delivery_status_isDisabled": false,
										"delivery_description_isDisabled": false,
										"receiving_status_isDisabled": false,
										},

	
		
		
					// 用户列表
				list_user_merchant_users: [],
				
		
		
		
					// 用户列表
				list_user_student_users: [],
				
		
		
		
		
					// 用户列表
				list_user_delivery_users: [],
								// 配送状态选项列表
				list_delivery_status: ['待取餐','取餐中','配送中','已完成'],
	
		
						// 收货状态选项列表
				list_receiving_status: ['确认收货'],
	
	
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
                    this.list_user_merchant_users = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
					get_user_merchant_users(id){
				var obj = this.list_user_merchant_users.getObj({"user_id":id});
				var ret = "";
				if(obj){
					if(obj.nickname){
						ret = obj.nickname;}
					else{
						ret = obj.username;
					}
				}
				return ret;
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
                    this.list_user_student_users = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
					get_user_student_users(id){
				var obj = this.list_user_student_users.getObj({"user_id":id});
				var ret = "";
				if(obj){
					if(obj.nickname){
						ret = obj.nickname;}
					else{
						ret = obj.username;
					}
				}
				return ret;
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
                    this.list_user_delivery_users = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
					get_user_delivery_users(id){
				var obj = this.list_user_delivery_users.getObj({"user_id":id});
				var ret = "";
				if(obj){
					if(obj.nickname){
						ret = obj.nickname;}
					else{
						ret = obj.username;
					}
				}
				return ret;
			},
			
	
			
	
			
	
		
			/**
			 * 获取对象之前
			 * @param {Object} param
			 */
			get_obj_before(param) {
				var form = "";
														// 获取缓存数据附加
				form = $.db.get("form");
							$.push(this.form ,form);
												
				if(this.form && form){
					Object.keys(this.form).forEach(key => {
						Object.keys(form).forEach(dbKey => {
							// if(dbKey === "charging_standard"){
							// 	this.form['charging_rules'] = form[dbKey];
							// 	this.disabledObj['charging_rules_isDisabled'] = true;
							// };
							if(key === dbKey){
								this.disabledObj[key+'_isDisabled'] = true;
							}
						})
					})
				}
																																		$.db.del("form");
				return param;
			},

			/**
			 * 获取对象之后
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json, func){


																																													


			},

			/**
			 * 提交前验证事件
			 * @param {Object} 请求参数
			 * @return {String} 验证成功返回null, 失败返回错误提示
			 */
			submit_check(param) {
				let msg = null
																																																			return msg;
			},

			is_view(){
				var bl = this.user_group == "管理员";

				if(!bl){
					bl = this.$check_action('/delivery_order/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/delivery_order/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/delivery_order/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/delivery_order/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/delivery_order/view','get');
					console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
				}

				console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

				return bl;
			},
			/**
			 * 上传文件
			 * @param {Object} param
			 */
			uploadimg(param) {
				this.uploadFile(param.file, "avatar");
			},

		},
		created() {
									this.get_list_user_merchant_users();
														this.get_list_user_student_users();
																this.get_list_user_delivery_users();
											},
	}
</script>

<style>
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

	.avatar-uploader-icon {
		font-size: 28px;
		color: #8c939d;
		width: 178px;
		height: 178px;
		line-height: 178px;
		text-align: center;
	}

	.avatar {
		width: 178px;
		height: 178px;
		display: block;
	}




</style>
