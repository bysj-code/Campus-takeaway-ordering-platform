<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','store_name') || $check_field('add','store_name') || $check_field('set','store_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="店铺名称" prop="store_name">
												<el-input id="store_name" v-model="form['store_name']" placeholder="请输入店铺名称"
							  v-if="user_group === '管理员' || (form['food_information_id'] && $check_field('set','store_name')) || (!form['food_information_id'] && $check_field('add','store_name'))" :disabled="disabledObj['store_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','store_name')">{{form['store_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','merchant_users') || $check_field('add','merchant_users') || $check_field('set','merchant_users')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="商家用户" prop="merchant_users">
																		<div v-if="user_group !== '管理员'">
							{{ get_user_session_merchant_users(form['merchant_users']) }}
							<!--<el-input id="business_name" v-model="form['merchant_users']" placeholder="请输入商家用户"-->
							<!--v-if="user_group === '管理员' || (form['food_information_id'] && $check_field('set','merchant_users')) || (!form['food_information_id'] && $check_field('add','merchant_users'))" :disabled="disabledObj['merchant_users_isDisabled']"></el-input>-->
							<!--<div v-else-if="$check_field('get','merchant_users')">{{form['merchant_users']}}</div>-->
							<el-select v-if="user_group === '管理员' || (form['food_information_id'] && $check_field('set','merchant_users')) || (!form['food_information_id'] && $check_field('add','merchant_users'))" id="merchant_users" v-model="form['merchant_users']" :disabled="disabledObj['merchant_users_isDisabled']">
								<el-option v-for="o in list_user_merchant_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
							<el-select v-else-if="$check_field('get','merchant_users')" id="merchant_users" v-model="form['merchant_users']" :disabled="true">
								<el-option v-for="o in list_user_merchant_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
						</div>
						<el-select v-else id="merchant_users" v-model="form['merchant_users']" :disabled="disabledObj['merchant_users_isDisabled']">
							<el-option v-for="o in list_user_merchant_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
																</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','food_name') || $check_field('add','food_name') || $check_field('set','food_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="美食名称" prop="food_name">
												<el-input id="food_name" v-model="form['food_name']" placeholder="请输入美食名称"
							  v-if="user_group === '管理员' || (form['food_information_id'] && $check_field('set','food_name')) || (!form['food_information_id'] && $check_field('add','food_name'))" :disabled="disabledObj['food_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','food_name')">{{form['food_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','food_types') || $check_field('add','food_types') || $check_field('set','food_types')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="美食类型" prop="food_types">
								<el-select id="food_types" v-model="form['food_types']"
						v-if="user_group === '管理员' || (form['food_information_id'] && $check_field('set','food_types')) || (!form['food_information_id'] && $check_field('add','food_types'))">
						<el-option v-for="o in list_food_types" :key="o['food_types']" :label="o['food_types']"
							:value="o['food_types']">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','food_types')">{{form['food_types']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','food_prices') || $check_field('add','food_prices') || $check_field('set','food_prices')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="美食价格" prop="food_prices">
								<el-input-number id="food_prices" v-model.number="form['food_prices']"
						v-if="user_group === '管理员' || (form['food_information_id'] && $check_field('set','food_prices')) || (!form['food_information_id'] && $check_field('add','food_prices'))" :disabled="disabledObj['food_prices_isDisabled']"></el-input-number>
					<div v-else-if="$check_field('get','food_prices')">{{form['food_prices']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','food_pictures') || $check_field('add','food_pictures') || $check_field('set','food_pictures')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="美食图片" prop="food_pictures">
								<el-upload :disabled="disabledObj['food_pictures_isDisabled']" id="food_pictures" class="avatar-uploader" drag
						accept="image/gif, image/jpeg, image/png, image/jpg" action="" :http-request="upload_food_pictures"
						:show-file-list="false" v-if="user_group === '管理员' || (form['food_information_id'] && $check_field('set','food_pictures')) || (!form['food_information_id'] && $check_field('add','food_pictures'))">
						<img v-if="form['food_pictures']" :src="$fullUrl(form['food_pictures'])" class="avatar">
						<i v-else class="el-icon-plus avatar-uploader-icon"></i>
					</el-upload>
					<el-image v-else-if="$check_field('get','food_pictures')" style="width: 100px; height: 100px"
						:src="$fullUrl(form['food_pictures'])" :preview-src-list="[$fullUrl(form['food_pictures'])]">
						<div slot="error" class="image-slot">
							<img src="../../../public/img/error.png" style="width: 90px; height: 90px" />
						</div>
					</el-image>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','food_introduction') || $check_field('add','food_introduction') || $check_field('set','food_introduction')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="美食介绍" prop="food_introduction">
								<el-input type="textarea" id="food_introduction" v-model="form['food_introduction']" placeholder="请输入美食介绍"
						v-if="user_group === '管理员' || (form['food_information_id'] && $check_field('set','food_introduction')) || (!form['food_information_id'] && $check_field('add','food_introduction'))" :disabled="disabledObj['food_introduction_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','food_introduction')">{{form['food_introduction']}}</div>
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
				field: "food_information_id",
				url_add: "~/api/food_information/add?",
				url_set: "~/api/food_information/set?",
				url_get_obj: "~/api/food_information/get_obj?",
				url_upload: "~/api/food_information/upload?",

				query: {
					"food_information_id": 0,
				},

				form: {
								"store_name":  '', // 店铺名称
										"merchant_users": 0, // 商家用户
										"food_name":  '', // 美食名称
										"food_types":  '', // 美食类型
										"food_prices":  0, // 美食价格
										"food_pictures":  '', // 美食图片
										"food_introduction":  '', // 美食介绍
											"food_information_id": 0, // ID
						
				},
				disabledObj:{
								"store_name_isDisabled": false,
										"merchant_users_isDisabled": false,
										"food_name_isDisabled": false,
										"food_types_isDisabled": false,
					          			"food_prices_isDisabled": false,
										"food_pictures_isDisabled": false,
										"food_introduction_isDisabled": false,
										},

	
		
					// 用户列表
				list_user_merchant_users: [],
						// 用户组
				group_user_merchant_users: "",
				
						// 美食类型选项列表
				list_food_types: [""],
	
		
		
		
	
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
					/**
			 * 获取商家用户用户组
			 */
			async get_group_user_merchant_users() {
							this.form["merchant_users"] = this.user.user_id;
							var json = await this.$get("~/api/user_group/get_obj?name=商家用户");
				if(json.result && json.result.obj){
					this.group_user_merchant_users = json.result.obj;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_session_merchant_users(id){
				var _this = this;
				var user_id = {"user_id":id}
				var url = "~/api/"+_this.group_user_merchant_users.source_table+"/get_obj?"
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
												_this.form["merchant_users"] = id
									_this.disabledObj['merchant_users' + '_isDisabled'] = true
						for (var i=0;i<arr.length;i++){
						  if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
							for (var j = 0; j < arrForm.length; j++) {
							  if (arr[i] === arrForm[j]) {
								if (arr[i] !== "merchant_users") {
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
			 * 获取美食类型列表
			 */
			async get_list_food_types() {
				var json = await this.$get("~/api/type_management/get_list?");
				if(json.result && json.result.list){
					this.list_food_types = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
	
			
	
						/**
			 * 上传美食图片
			 * @param {Object} param 图片参数
			 */
			upload_food_pictures(param){
						this.uploadFile(param.file, "food_pictures");
					},
	
	
			
	
		
			/**
			 * 获取对象之前
			 * @param {Object} param
			 */
			get_obj_before(param) {
				var form = "";
																	
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
					bl = this.$check_action('/food_information/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/food_information/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/food_information/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/food_information/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/food_information/view','get');
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
					this.get_group_user_merchant_users();
									this.get_list_food_types();
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
