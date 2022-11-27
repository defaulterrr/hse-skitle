import json

from django.contrib.auth import authenticate
from django.contrib.auth.models import User
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt

from app.models import Token


# Create your views here.


@csrf_exempt
def auth(request):
    data = json.loads(request.body.decode("utf-8"))
    username = data["username"]
    password = data["password"]
    user = authenticate(username=username, password=password)
    if user is None:
        return JsonResponse({"token": None})
    return JsonResponse({"token": Token.objects.get(user=user).token})


def get_user(request):
    token = request.GET["token"]
    token = Token.objects.filter(token=token).first()
    if token is None:
        return JsonResponse({"user": None})
    return JsonResponse(
        {"user": {"id": token.user.id, "username": token.user.username}}
    )


@csrf_exempt
def register(request):
    data = json.loads(request.body.decode("utf-8"))
    username = data["username"]
    email = data["email"]
    password = data["password"]
    user = User.objects.create_user(username=username, email=email, password=password)
    token = Token.objects.create(user=user)
    return JsonResponse({"token": token.token})
