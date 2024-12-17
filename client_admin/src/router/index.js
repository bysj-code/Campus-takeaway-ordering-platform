import Vue from 'vue';
import VueRouter from 'vue-router';
import index from '../views/index.vue';
import login from '../views/login.vue';
import forgot from '../views/forgot.vue';
Vue.use(VueRouter)

const routes = [
	// 主页
	{
		path: '/',
		name: 'index',
		component: index,
		meta: {
			index: 0,
			title: '首页'
		}
	},

	// 登录
	{
		path: '/login',
		name: 'login',
		component: login,
		meta: {
			index: 0,
			title: '登录'
		}
	},


	// 忘记密码
	{
		path: '/forgot',
		name: "forgot",
		component: forgot,
		meta: {
			index: 0,
			title: '忘记密码'
		}
	},

	// 修改密码
	{
		path: '/user/password',
		name: "password",
		component: () => import("../views/user/password.vue"),
		meta: {
			index: 0,
			title: '修改密码'
		}
	},

	// 视频播放页
	{
		path: "/media/video",
		name: "video",
		component: () => import('../views/media/video.vue'),
		meta: {
			index: 0,
			title: "视频"
		}
	},

	// 音频播放页
	{
		path: "/media/audio",
		name: "audio",
		component: () => import('../views/media/audio.vue'),
		meta: {
			index: 0,
			title: "音频"
		}
	},



	// 友情链接路由
	// {
	// 	path: '/link/table',
	// 	name: 'link_table',
	// 	component: () => import('../views/link/table.vue'),
	// 	meta: {
	// 		index: 0,
	// 		title: '链接列表'
	// 	}
	// },
	// {
	// 	path: '/link/view',
	// 	name: 'link_view',
	// 	component: () => import('../views/link/view.vue'),
	// 	meta: {
	// 		index: 0,
	// 		title: '链接详情'
	// 	}
	// },

	// 轮播图路由
	{
		path: '/slides/table',
		name: 'slides_table',
		component: () => import('../views/slides/table.vue'),
		meta: {
			index: 0,
			title: '轮播图列表'
		}
	},
	{
		path: '/slides/view',
		name: 'slides_view',
		component: () => import('../views/slides/view.vue'),
		meta: {
			index: 0,
			title: '轮播图详情'
		}
	},
		// 文章路由
	{
		path: '/article/table',
		name: 'article_table',
		component: () => import('../views/article/table.vue'),
		meta: {
			index: 0,
			title: '文章列表'
		}
	},
	{
		path: '/article/view',
		name: 'article_view',
		component: () => import('../views/article/view.vue'),
		meta: {
			index: 0,
			title: '文章详情'
		}
	},

	// 文章分类路由
	{
		path: '/article_type/table',
		name: 'article_type_table',
		component: () => import('../views/article_type/table.vue'),
		meta: {
			index: 0,
			title: '文章分类列表'
		}
	},
	{
		path: '/article_type/view',
		name: 'article_type_view',
		component: () => import('../views/article_type/view.vue'),
		meta: {
			index: 0,
			title: '文章分类详情'
		}
	},
	
	// 广告路由
	// {
	// 	path: '/ad/table',
	// 	name: 'ad_table',
	// 	component: () => import('../views/ad/table.vue'),
	// 	meta: {
	// 		index: 0,
	// 		title: '广告列表'
	// 	}
	// },
	// {
	// 	path: '/ad/view',
	// 	name: 'ad_view',
	// 	component: () => import('../views/ad/view.vue'),
	// 	meta: {
	// 		index: 0,
	// 		title: '广告详情'
	// 	}
	// },



	// 公告路由
	{
		path: '/notice/table',
		name: 'notice_table',
		component: () => import('../views/notice/table.vue'),
		meta: {
			index: 0,
			title: '公告信息列表'
		}
	},
	{
		path: '/notice/view',
		name: 'notice_view',
		component: () => import('../views/notice/view.vue'),
		meta: {
			index: 0,
			title: '公告信息详情'
		}
	},


	// 评论路由
	{
		path: '/comment/table',
		name: 'comment_table',
		component: () => import('../views/comment/table.vue'),
		meta: {
			index: 0,
			title: '评论列表'
		}
	},
	{
		path: '/comment/view',
		name: 'comment_view',
		component: () => import('../views/comment/view.vue'),
		meta: {
			index: 0,
			title: '评论详情'
		}
	},

	// 学生用户路由
	{
		path: '/student_users/table',
		name: 'student_users_table',
		component: () => import('../views/student_users/table.vue'),
		meta: {
			index: 0,
			title: '学生用户列表'
		}
	},
	{
		path: '/student_users/view',
		name: 'student_users_view',
		component: () => import('../views/student_users/view.vue'),
		meta: {
			index: 0,
			title: '学生用户详情'
		}
	},
	// 配送用户路由
	{
		path: '/delivery_users/table',
		name: 'delivery_users_table',
		component: () => import('../views/delivery_users/table.vue'),
		meta: {
			index: 0,
			title: '配送用户列表'
		}
	},
	{
		path: '/delivery_users/view',
		name: 'delivery_users_view',
		component: () => import('../views/delivery_users/view.vue'),
		meta: {
			index: 0,
			title: '配送用户详情'
		}
	},
	// 商家用户路由
	{
		path: '/merchant_users/table',
		name: 'merchant_users_table',
		component: () => import('../views/merchant_users/table.vue'),
		meta: {
			index: 0,
			title: '商家用户列表'
		}
	},
	{
		path: '/merchant_users/view',
		name: 'merchant_users_view',
		component: () => import('../views/merchant_users/view.vue'),
		meta: {
			index: 0,
			title: '商家用户详情'
		}
	},
	// 美食信息路由
	{
		path: '/food_information/table',
		name: 'food_information_table',
		component: () => import('../views/food_information/table.vue'),
		meta: {
			index: 0,
			title: '美食信息列表'
		}
	},
	{
		path: '/food_information/view',
		name: 'food_information_view',
		component: () => import('../views/food_information/view.vue'),
		meta: {
			index: 0,
			title: '美食信息详情'
		}
	},
	// 美食订单路由
	{
		path: '/food_orders/table',
		name: 'food_orders_table',
		component: () => import('../views/food_orders/table.vue'),
		meta: {
			index: 0,
			title: '美食订单列表'
		}
	},
	{
		path: '/food_orders/view',
		name: 'food_orders_view',
		component: () => import('../views/food_orders/view.vue'),
		meta: {
			index: 0,
			title: '美食订单详情'
		}
	},
	// 配送订单路由
	{
		path: '/delivery_order/table',
		name: 'delivery_order_table',
		component: () => import('../views/delivery_order/table.vue'),
		meta: {
			index: 0,
			title: '配送订单列表'
		}
	},
	{
		path: '/delivery_order/view',
		name: 'delivery_order_view',
		component: () => import('../views/delivery_order/view.vue'),
		meta: {
			index: 0,
			title: '配送订单详情'
		}
	},
	// 留言信息路由
	{
		path: '/message_information/table',
		name: 'message_information_table',
		component: () => import('../views/message_information/table.vue'),
		meta: {
			index: 0,
			title: '留言信息列表'
		}
	},
	{
		path: '/message_information/view',
		name: 'message_information_view',
		component: () => import('../views/message_information/view.vue'),
		meta: {
			index: 0,
			title: '留言信息详情'
		}
	},
	// 类型管理路由
	{
		path: '/type_management/table',
		name: 'type_management_table',
		component: () => import('../views/type_management/table.vue'),
		meta: {
			index: 0,
			title: '类型管理列表'
		}
	},
	{
		path: '/type_management/view',
		name: 'type_management_view',
		component: () => import('../views/type_management/view.vue'),
		meta: {
			index: 0,
			title: '类型管理详情'
		}
	},

	// 用户路由
	{
		path: '/user/table',
		name: 'user_table',
		component: () => import('../views/user/table.vue'),
		meta: {
			index: 0,
			title: '用户列表'
		}
	},
	{
		path: '/user/view',
		name: 'user_view',
		component: () => import('../views/user/view.vue'),
		meta: {
			index: 0,
			title: '用户详情'
		}
	},
	{
		path: '/user/info',
		name: 'user_info',
		component: () => import('../views/user/info.vue'),
		meta: {
			index: 0,
			title: '个人信息'
		}
	},
	// 用户组路由
	{
		path: '/user_group/table',
		name: 'user_group_table',
		component: () => import('../views/user_group/table.vue'),
		meta: {
			index: 0,
			title: '用户组列表'
		}
	},
	{
		path: '/user_group/view',
		name: 'user_group_view',
		component: () => import('../views/user_group/view.vue'),
		meta: {
			index: 0,
			title: '用户组详情'
		}
	}
]

const router = new VueRouter({
	mode: 'history',
	base: process.env.BASE_URL,
	routes
})

router.beforeEach((to, from, next) => {
	let token = to.query.token;
	if (token){
		$.db.set("token",token,120);
	}
	next();
})

router.afterEach((to, from, next) => {
	let title = "校园外卖点餐平台小程序-admin";
	document.title = title;
})

export default router
