# -*- coding: utf-8 -*-
from django.shortcuts import render,get_object_or_404
from django.http import JsonResponse,HttpResponse
from .models import TypeInfo,GoodsInfo
from django.core.paginator import Paginator,EmptyPage ,PageNotAnInteger
def index(request):
    #商品类
    goods = TypeInfo.objects.all().order_by()[:6]  # 取出最新信息前6条
    #商品名称
    #post_list = GoodsInfo.objects.all().order_by('-gtime')[:4]   #取出最新信息前4条
    # 楼层
    p = TypeInfo.objects.all()[0]
    xxsg = p.goodsinfo_set.all().order_by('gtime')[:4]
    #海鲜水产
    type = TypeInfo.objects.all()[1]
    hxsc = type.goodsinfo_set.all().order_by('gtime')[:4]
    #猪肉 牛羊
    r = TypeInfo.objects.all()[2]
    zrny = r.goodsinfo_set.all().order_by('gtime')[:4]
    #禽类蛋品
    dan = TypeInfo.objects.all()[3]
    qldp = dan.goodsinfo_set.all().order_by('gtime')[:4]
    #新鲜蔬菜
    sc = TypeInfo.objects.all()[4]
    xxsc = sc.goodsinfo_set.all().order_by('gtime')[:4]
    #速冻食品
    sp =TypeInfo.objects.all()[5]
    sdsp = sp.goodsinfo_set.all().order_by('gtime')[:4]

    return render(request,'index.html',context={'goods':goods,'xxsg':xxsg,'hxsc':hxsc,'zrny':zrny,'qldp':qldp,'xxsc':xxsc,'sdsp':sdsp})


def detail(request,id):
    goods = GoodsInfo.objects.get(pk=int(id))
    # goodsinfo = get_object_or_404(GoodsInfo,id = id)
    goodsinfo = GoodsInfo.objects.get(id = id)
    response = render(request,'detail.html',context={'goodsinfo':goodsinfo})
    goods_ids = request.COOKIES.get('goods_ids','')
    # goods_ids是之前点击过的商品的id的集合，返回的是字符串
    # print(type(goods_ids))
    # 此时的goods_id是点击的商品的id
    goods_id = '%d'%goods.id
    # print(goods_id)
    if goods_ids != '':
        # 将之前点击过得商品id的集合用，分割成列表
        goods_ids1 = goods_ids.split(',')
        # print(goods_ids1)
        # 判断goods_ids1这个列表中是否含有当前点击的商品的id,如果有，则删除，如果没有，则在第一个位置添加
        if goods_ids1.count(goods_id)>=1:
            goods_ids1.remove(goods_id)
        goods_ids1.insert(0,goods_id)
        print(goods_ids)
        # 如果列表中的元素个数大于等于6,则删除第6个
        if len(goods_ids1)>=6:
            del goods_ids1[5]
        # 使用join方法，将原来的序列按照指定的符号链接成字符串
        goods_ids = ','.join(goods_ids1)
        print(goods_ids)
    else:
        goods_ids = goods_id


    response.set_cookie('goods_ids',goods_ids)
    return response


#全部list
def goodslist(request,pIndex,bq):
    #新品推荐
    tj = GoodsInfo.objects.filter(gtj=True).order_by('-gtime')[:2]
    #分页显示
    biaoqian = bq
    if biaoqian == "1":#默认
        list1 = GoodsInfo.objects.all().order_by('-gtime')
    elif biaoqian == "2":#价格
        list1 = GoodsInfo.objects.all().order_by('-gprice')
    else: #点击
        list1 = GoodsInfo.objects.all().order_by('-gclick')
    p = Paginator(list1,15)
    if pIndex == '':
        pIndex = '1'
    pIndex = int(pIndex)
    #取第几分页对象
    list2 = p.page(pIndex)
    plist = p.page_range
    return render(request, 'list.html', {'list': list2, 'plist': plist, 'pIndex': pIndex,'tj':tj,'biaoqian':biaoqian})

#查询点击最高
def hot(request):
    # 新品推荐
    tj = GoodsInfo.objects.filter(gtj=True).order_by('-gtime')[:2]
    #分页
    jgj = GoodsInfo.objects.all().order_by('-gclick')
    paginator = Paginator(jgj, 15)
    page = request.GET.get('page')
    try:
         contacts = paginator.page(page)
    except PageNotAnInteger:
         contacts = paginator.page(1)
    except EmptyPage:
         contacts = paginator.page(paginator.num_pages)
    # 取第几分页对象
    return render(request, 'typelist.html', {'contacts': contacts,'tj':tj})

def typelist(request,typeid,bq):
    r = TypeInfo(id=typeid)
    print(r)
    if bq == '1':
        jgj = r.goodsinfo_set.all().order_by('-gtime')
    elif bq == '2':
        jgj = r.goodsinfo_set.all().order_by('-gprice')
    else:
        jgj = r.goodsinfo_set.all().order_by('-gclick')
    return render(request, 'typelist.html', {'list': jgj,'typeid':typeid})

def mysearch(request):
    return render(request,'mysearch.html')




