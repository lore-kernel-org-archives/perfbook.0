Return-Path: <SRS0=Ggdu=IS=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=qMriwXlEWqtANGN9DVsqjzj3lTM9bgnZxk7496en56k=;
        b=EoTgMQw6yAD7Tgc+34bGVrF2qcv4ZSHt2D9osdNJPLM742CJJsR85ZNJRYZfE6Wbbw
         Wly3Ap+wBNqlCo3/lak1y8sh3N5x5vhP0MhAn5ZdQTf/XY8Osc8BTuW4hClypLuS0XF6
         LsjB15U/vGGI2KKccfB8tRcOIDUXYVh5hhR2i5egy0YI2CChpuVsrobZrZFPwHeXKjYZ
         3Y2im4BcfOIbxG/3kiwmN+si6yQBg/DKmW7yln/wBaGx+Wbwa/LWEGTOywCRRZa2+aqM
         dFVduT+ykQWuvRHvNOjHmH0CjngqMsbbKLBrXOf1oEuT+/XOUT0kh8tC/ezVr0HoHPNR
         dpSQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 1/3 -perfbook] bib/hw: Improve looks of
 WilliamGWong2019CCIX-CXL's title
Message-ID: <85bad10b-4875-b98f-8c3d-547625460817@gmail.com>
Date: Sun, 21 Mar 2021 00:16:01 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Also avoid the UTF-8 encoded symbol of "=E2=80=A6".
\ldots looks close enough to the title of the web page.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/hw.bib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bib/hw.bib b/bib/hw.bib
index 2ece29d6..ccb35e94 100644
--- a/bib/hw.bib
+++ b/bib/hw.bib
@@ -1025,7 +1025,7 @@ Luis Stevens and Anoop Gupta and John Hennessy",
=20
 @unpublished{WilliamGWong2019CCIX-CXL,
  Author=3D"William G. Wong",
- Title=3D"VHS or Betamax=E2=80=A6CCIX or CXL=E2=80=A6So Many Choices",
+ Title=3D"{VHS} or {Betamax} \ldots\ {CCIX} or {CXL} \ldots\ So Many Cho=
ices",
  month=3D"March",
  day=3D"14",
  year=3D"2019",
--=20
2.17.1


