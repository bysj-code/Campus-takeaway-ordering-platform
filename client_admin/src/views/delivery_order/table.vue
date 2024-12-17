<template>
	<el-main class="bg table_wrap">
		<el-form label-position="right" :model="query" class="form p_4" label-width="120">
			<el-row>


										<el-col :xs="24" :sm="24" :lg="8" class="el_form_search_wrap">
					<el-form-item label="店铺名称">
									<el-input v-model="query.store_name"></el-input>
								</el-form-item>
				</el-col>
												<el-col :xs="24" :sm="24" :lg="8" class="el_form_search_wrap">
					<el-form-item label="美食名称">
									<el-input v-model="query.food_name"></el-input>
								</el-form-item>
				</el-col>
																																	<el-col :xs="24" :sm="24" :lg="8" class="el_form_search_wrap">
					<el-form-item label="配送状态">
									<el-select v-model="query.delivery_status">
				                            <el-option v-for="o in list_delivery_status" :key="o" :label="o"
                            	:value="o">
                            </el-option>
										</el-select>
								</el-form-item>
				</el-col>
													<el-col :xs="24" :sm="10" :lg="8" class="search_btn_wrap_1">
					<el-form-item>
						<el-button type="primary" @click="search()" class="search_btn_find">查询</el-button>
						<el-button @click="reset()" style="margin-right: 74px;" class="search_btn_reset">重置</el-button>
						<router-link v-if="user_group == '管理员' || $check_action('/delivery_order/table','add') || $check_action('/delivery_order/view','add')" class="el-button el-button--default el-button--primary search_btn_add" to="./view?">添加
						</router-link>
            			<el-button v-if="user_group == '管理员' || $check_action('/delivery_order/table','del') || $check_action('/delivery_order/view','del')" class="search_btn_del" type="danger" @click="delInfo()">删除</el-button>
					</el-form-item>
				</el-col>

			</el-row>
		</el-form>
		<el-table :data="list" @selection-change="selectionChange" @sort-change="$sortChange" style="width: 100%" id="dataTable">
			<el-table-column fixed type="selection" tooltip-effect="dark" width="55">
			</el-table-column>
				<el-table-column prop="order_number" @sort-change="$sortChange" label="订单编号"
				v-if="user_group == '管理员' || $check_field('get','order_number')" min-width="200">
					</el-table-column>
					<el-table-column prop="store_name" @sort-change="$sortChange" label="店铺名称"
				v-if="user_group == '管理员' || $check_field('get','store_name')" min-width="200">
					</el-table-column>
					<el-table-column prop="merchant_users" @sort-change="$sortChange" label="商家用户"
				v-if="user_group == '管理员' || $check_field('get','merchant_users')" min-width="200">
						<template slot-scope="scope">
					{{ get_user_merchant_users(scope.row['merchant_users']) }}
				</template>
					</el-table-column>
					<el-table-column prop="food_name" @sort-change="$sortChange" label="美食名称"
				v-if="user_group == '管理员' || $check_field('get','food_name')" min-width="200">
					</el-table-column>
					<el-table-column prop="food_types" @sort-change="$sortChange" label="美食类型"
				v-if="user_group == '管理员' || $check_field('get','food_types')" min-width="200">
					</el-table-column>
					<el-table-column prop="food_prices" @sort-change="$sortChange" label="美食价格"
				v-if="user_group == '管理员' || $check_field('get','food_prices')" min-width="200">
					</el-table-column>
					<el-table-column prop="student_users" @sort-change="$sortChange" label="学生用户"
				v-if="user_group == '管理员' || $check_field('get','student_users')" min-width="200">
						<template slot-scope="scope">
					{{ get_user_student_users(scope.row['student_users']) }}
				</template>
					</el-table-column>
					<el-table-column prop="student_name" @sort-change="$sortChange" label="学生姓名"
				v-if="user_group == '管理员' || $check_field('get','student_name')" min-width="200">
					</el-table-column>
					<el-table-column prop="contact_number" @sort-change="$sortChange" label="联系电话"
				v-if="user_group == '管理员' || $check_field('get','contact_number')" min-width="200">
					</el-table-column>
					<el-table-column prop="shipping_address" @sort-change="$sortChange" label="收货地址"
				v-if="user_group == '管理员' || $check_field('get','shipping_address')" min-width="200">
					</el-table-column>
					<el-table-column prop="purchase_quantity" @sort-change="$sortChange" label="购买数量"
				v-if="user_group == '管理员' || $check_field('get','purchase_quantity')" min-width="200">
					</el-table-column>
					<el-table-column prop="delivery_users" @sort-change="$sortChange" label="配送用户"
				v-if="user_group == '管理员' || $check_field('get','delivery_users')" min-width="200">
						<template slot-scope="scope">
					{{ get_user_delivery_users(scope.row['delivery_users']) }}
				</template>
					</el-table-column>
					<el-table-column prop="delivery_status" @sort-change="$sortChange" label="配送状态"
				v-if="user_group == '管理员' || $check_field('get','delivery_status')" min-width="200">
					</el-table-column>
					<el-table-column prop="delivery_description" @sort-change="$sortChange" label="配送描述"
				v-if="user_group == '管理员' || $check_field('get','delivery_description')" min-width="200">
					</el-table-column>
					<el-table-column prop="receiving_status" @sort-change="$sortChange" label="收货状态"
				v-if="user_group == '管理员' || $check_field('get','receiving_status')" min-width="200">
					</el-table-column>
	



            <el-table-column sortable prop="create_time" label="创建时间" min-width="200">
                <template slot-scope="scope">
                	{{ $toTime(scope.row["create_time"],"yyyy-MM-dd hh:mm:ss") }}
                </template>
            </el-table-column>

			<el-table-column sortable prop="update_time" label="更新时间" min-width="200">
                <template slot-scope="scope">
                	{{ $toTime(scope.row["update_time"],"yyyy-MM-dd hh:mm:ss") }}
                </template>
			</el-table-column>







			<el-table-column fixed="right" label="操作" min-width="120" v-if="user_group == '管理员' || $check_action('/delivery_order/table','set') || $check_action('/delivery_order/view','set') || $check_action('/delivery_order/view','get') || $check_action('/留言/table','add') || $check_action('/留言/view','add')" >


				<template slot-scope="scope">
					<router-link class="el-button el-button--small is-plain el-button--success" style="margin: 5px !important;"
					v-if="user_group == '管理员' || $check_action('/delivery_order/table','set') || $check_action('/delivery_order/view','set') || $check_action('/delivery_order/view','get')"
						:to="'./view?' + field + '=' + scope.row[field]"
						 size="small">
						<span>详情</span>
					</router-link>
				</template>
			</el-table-column>

		</el-table>

		<!-- 分页器 -->
		<div class="mt text_center">
			<el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange"
				:current-page="query.page" :page-sizes="[7, 10, 30, 100]" :page-size="query.size"
				layout="total, sizes, prev, pager, next, jumper" :total="count">
			</el-pagination>
		</div>
		<!-- /分页器 -->

															
		<div class="modal_wrap" v-if="showModal">
			<div class="modal_box">
				<!-- <div class="modal_box_close" @click="closeModal">X</div> -->
				<p class="modal_box_title">重要提醒</p>
				<p class="modal_box_text">当前有数据达到预警值！</p>
				<div class="btn_box">
					<span @click="closeModal">取消</span>
					<span @click="closeModal">确定</span>
				</div>
			</div>
		</div>


	</el-main>
</template>
<script>
	import mixin from "@/mixins/page.js";

	export default {
		mixins: [mixin],
		data() {
			return {
				// 弹框
				showModal: false,
				// 获取数据地址
				url_get_list: "~/api/delivery_order/get_list?like=0",
				url_del: "~/api/delivery_order/del?",

				// 字段ID
				field: "delivery_order_id",

				// 查询
				query: {
					"size": 7,
					"page": 1,
									"store_name": "",
												"food_name": "",
																			"delivery_status": "",
										"login_time": "",
					"create_time": "",
					"orderby": `create_time desc`
				},

				// 数据
				list: [],
																											// 用户列表
				list_user_merchant_users: [],
															// 用户列表
				list_user_student_users: [],
																	// 用户列表
				list_user_delivery_users: [],
						// 配送状态列表
				list_delivery_status: ['待取餐','取餐中','配送中','已完成'],
									// 收货状态列表
				list_receiving_status: ['确认收货'],
					}
		},
		methods: {
			// 关闭弹框
			closeModal(){
				this.showModal = false;
				},

			get_list_before(param){
				var user_group = this.user.user_group;
				if(user_group != "管理员"){
						let sqlwhere = "(";
																				if(user_group=="商家用户"){
						sqlwhere+= "merchant_users = " + this.user.user_id + " or ";
					}
																												if(user_group=="学生用户"){
						sqlwhere+= "student_users = " + this.user.user_id + " or ";
					}
																																	if(user_group=="配送用户"){
						sqlwhere+= "delivery_users = " + this.user.user_id + " or ";
					}
																									if (sqlwhere.length>1){
						sqlwhere = sqlwhere.substr(0,sqlwhere.length-4);
						sqlwhere += ")";
						param["sqlwhere"] = sqlwhere;
					}
					}
				return param;
			},

																														



								/**
			 * 获取商家用户用户列表
			 */
			async get_list_user_merchant_users() {
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
					ret = obj.nickname+"-"+obj.username;
					// if(obj.nickname){
					// 	ret = obj.nickname;
					// }
					// else{
					// 	ret = obj.username;
					// }
				}
				return ret;
			},
												/**
			 * 获取学生用户用户列表
			 */
			async get_list_user_student_users() {
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
					ret = obj.nickname+"-"+obj.username;
					// if(obj.nickname){
					// 	ret = obj.nickname;
					// }
					// else{
					// 	ret = obj.username;
					// }
				}
				return ret;
			},
														/**
			 * 获取配送用户用户列表
			 */
			async get_list_user_delivery_users() {
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
					ret = obj.nickname+"-"+obj.username;
					// if(obj.nickname){
					// 	ret = obj.nickname;
					// }
					// else{
					// 	ret = obj.username;
					// }
				}
				return ret;
			},
											deleteRow(index, rows) {
				rows.splice(index, 1);
			}

		},
		created() {
											this.get_list_user_merchant_users();
														this.get_list_user_student_users();
																this.get_list_user_delivery_users();
									}
	}
</script>

<style type="text/css">
	.bg {
		background: white;
	}

	.form.p_4 {
		padding: 1rem;
	}

	.form .el-input {
		width: initial;
	}

	.mt {
		margin-top: 1rem;
	}

	.text_center {
		text-align: center;
	}

	.float-right {
		float: right;
	}


	.modal_wrap{
		width: 100vw;
		height: 100vh;
		position: fixed;
		top: 0;
		left: 0;
		background: rgba(0,0,0,0.5);
		z-index: 9999999999;
	}
	.modal_wrap .modal_box{
		width: 400px;
		height: 200px;
		background: url("../../assets/modal_bg.jpg") no-repeat center;
		background-size: cover;
		position: absolute;
		top: 50%;
		left: 50%;
		margin-left: -200px;
		margin-top: -100px;
		border-radius: 10px;
		}
	.modal_wrap .modal_box .modal_box_close{
		font-size: 20px;
		position: absolute;
		top: 10px;
		right: 10px;
		cursor: pointer;
		}
	.modal_wrap .modal_box .modal_box_title{
	  text-align: center;
    font-size: 18px;
    margin: 16px auto;
    color: #fff;
    border-bottom: 1px solid rgba(117, 116, 116,0.5);
    padding-bottom: 16px;
    width: 356px;
		}
	.modal_wrap .modal_box .modal_box_text{
			text-align: center;
		font-size: 15px;
		color: #fff;
		margin-top: 25px;
		}
	.modal_wrap .modal_box .btn_box{
		display: flex;
		flex-direction: row;
		justify-content: center;
		margin-top: 42px;
		}
			.modal_wrap .modal_box .btn_box span{
				display: inline-block;
				width: 80px;
				height: 30px;
				line-height: 30px;
				text-align: center;
				border: 1px solid #ccc;
				font-size: 14px;
				cursor: pointer;
				color: #fff;
			}
	.modal_wrap .modal_box .btn_box span:nth-child(2){
		background: #409EFF;
		color: #fff;
		border-color: #409EFF;
		margin-left: 15px;
	}
</style>
