from django.shortcuts import render,redirect
from django.http import  HttpResponse,JsonResponse
from df_user.models import  UserInfo
from goods.models import GoodsInfo
from .models import  CartInfo

def cart(request):
	uid = request.session['user_id']
	carts = CartInfo.objects.filter(user_id = uid)
	return render(request,'cart.html')

# def add(request,gid,count):
# 	uid = request.session['user_id']
#
# 	gid = int(gid)
# 	count = int(count)
# 	carts = CartInfo.objects.filter(user_id=uid,goods_id=gid)
# 	if len(carts)>=1:
# 		cart = carts[0]
# 		cart.count = cart.count+count
# 	else:
# 		cart = CartInfo()
# 		cart.user_id = uid
# 		cart.goods_id = gid
# 		cart.count = count
#
# 	if request.is_ajax():
# 		count = CartInfo.objects.filter(user_id=request.session['user_id']).count()
# 		return JsonResponse({'count':count})
# 	else:
# 		return redirect('/cart/')

# 当删除购物车某条还是那个品信息的时候触发此函数
def delete(request,cart_id):
	try:
	# 从购物车表拿到删除的商品的ID
		cart = CartInfo.objects.get(pk = int(cart_id))
		cart.delete()
		data={'ok':1}
	except Exception as e:
		data={'ok':0}
	return JsonResponse(data)
#当购物车里边的商品信息进行改变的时候触发此函数
def addnum(request):
	cid = request.POST.get('id')
	num = request.POST.get('s')
	cart = CartInfo.objects.filter(id=int(cid)).update(count=int(num))
	return HttpResponse('ok')

# 在detail.html中点击 “加入购物车”时候触发这个函数，判断加入的商品是不是之前加入过购物车，
# 如果是，在原来基础上加上这次加入的数量，如果不是，则从新实例化购物车对象，记录商品信息
def gwc(request):
	if request.method == 'POST':
		# 把加入的商品的gid和加入的数量gcount拿过来
		gid = request.POST.get('gid')
		gcount = request.POST.get('gcount')
		gcount= int(gcount)
		# 拿到当前登录用户的uid
		uid = request.session["user_id"]
		print(uid)
		# 因为每一次提交都是从购物车里提交出来的，购物车之后就不能再去删除已经选择的商品，
		# 所以在查询提交商品信息的时候都是从cartinfo这个表中查
		# 判断当前传入的商品信息是否在购物车表中存在
		carts = CartInfo.objects.filter(user_id=uid, goods_id=gid)
		print(carts)
		if len(carts) >= 1:
			cart = carts[0]
			print(cart)
			cart.count = cart.count + gcount
		else:
			cart = CartInfo()
			cart.user_id = uid
			cart.goods_id = gid
			cart.count = gcount
		cart.save()
		return HttpResponse('添加购物车成功')  #添加 信息重复数量+1

def showcar(request):
	uname = request.COOKIES["uname"]
	pp = UserInfo.objects.filter(uname=uname)[0]
	uid = pp.id
	ee = CartInfo.objects.filter(user_id = uid)
	lena = len(ee)
	print(lena)
	for i in ee:
		c = i.count
		# print(i.count)
	# list = CartInfo.objects.filter(user_id=uid)
	return render(request,'cart.html',{'list':ee,'leng':lena})


