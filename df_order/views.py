from django.shortcuts import render
from django.shortcuts import render,HttpResponse,redirect
from  df_cart.models import  CartInfo
from goods.models import GoodsInfo
from df_user.models import UserInfo
from .models import  OrderInfo,OrderDetailInfo
from datetime import  datetime
from django.db import transaction
# Create your views here.

#支付页
def place(request):
	#获取登录用户id
	#order = request.GET.getlist('cart_id')
	uid = request.session['user_id']
	# 通过当前登录用户的ID拿到用户的地址，从CartInfo表拿到商品的信息和数量
	uadress = UserInfo.objects.get(id = uid)
	carts = CartInfo.objects.filter(user_id=uid)
	a =  CartInfo.objects.filter(user_id=uid).count()
	# print(a)
	context = {'carts':carts,'count':a,'adress':uadress}
	return render(request,'place_order.html',context)

# 当在place_order.html中点击提交订单时候触发此函数
#@transaction.atomic()
def placeSubmit(request):
#创建订单对象
	#tran_id = transaction.savepoint()
	try:
		uid = request.session['user_id']
		#实例化订单表对象
		order = OrderInfo()
		#生成订单编号
		now = datetime.now()
		order.oid ='%s%d'%(now.strftime('%Y%m%d%H%M%S'),uid)
		order.user_id = uid
		order.odate = now
		order.oIsPay = request.POST['pay_style']
		order.ototal = request.POST['ototal']
		order.oaddress = request.POST['adress']
		order.save()
	#判断商品 库存
		#通过当前登录的用户id拿到购物车的所有商品信息，每一件商品在购物车表中对应一个id
		carts = CartInfo.objects.filter(user_id=uid)
		for e in carts:
			gwcid = int(e.id)
			detail = OrderDetailInfo()
			detail.order = order
			#查询购物车信息
			# 因为每一次提交都是从购物车里提交出来的，购物车之后就不能再去删除已经选择的商品，
			# 所以在查询提交商品信息的时候都是从cartinfo这个表中查
			cart = CartInfo.objects.get(id=gwcid)
			print(cart)
			#判断商品库存
			goods = cart.goods  #连接商品
			print(goods)
			if goods.gkucun>=cart.count: # 如果库存大于购买数量
				goods.gkucun = cart.goods.gkucun-cart.count
				goods.save()
				detail.goods_id = goods.id
				detail.price = goods.gprice
				detail.count = cart.count
				detail.save()
				#删除 购物车
				cart.delete()
			else:#如果 库存 小于购买数量
				# transaction.savepoint_rollback(tran_id)
				return redirect('/cart/showcar/')
		#transaction.savepoint_rollback(tran_id)
	except Exception as e:
		print('=====================%s'%e)
		#transaction.savepoint_rollback(tran_id)

	return redirect('/user/user_center_order/')


#创建详情对象
#修改商品库存
#删除购物车










