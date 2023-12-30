Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76AE23A0
	for <perfbook@vger.kernel.org>; Sat, 30 Dec 2023 08:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OBR6PsFi"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d427518d52so38020375ad.0
        for <perfbook@vger.kernel.org>; Sat, 30 Dec 2023 00:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703926790; x=1704531590; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dowVOX0N23MZvMs1PSfZwokLJBo14+lOnp9rUUSd3n8=;
        b=OBR6PsFiIMRl+NTs0bgQyaymds9nhDzOScSQ8lVIWzkcu31sDaiMvkcsg4+gjQi4zL
         cj0dzalIIzQUICiD29tC1yt+lHI4YJpQY8XMUNiItBwRkqHrxn0b0IoWpOLQDF7NJiIG
         Wt4A7sZ+VGLWurIL5RRZp5lpLBgjbA5xqNi3ro017M9zlULcFj+GQ9MGQa30VDrYFtLr
         jueM5SA1KmSF2d2QTwosuu+i4Wwa65wpDcnak+diPhq8q4TORLVQE032DOEd7llyumf+
         Q2M6z4ARMbfUMVqPXehW0ED2aqKOAOwC5kuqA2V1YNS852HKPD8V5a0MngRfRF928rKZ
         3JfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703926790; x=1704531590;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dowVOX0N23MZvMs1PSfZwokLJBo14+lOnp9rUUSd3n8=;
        b=Yplh8YFF0BCCCzJBRSgNXRuaNV+k7XzLbsIfJ176UDxb1SNFRpvhCgOwQ2JZlegGxn
         9kfE0KqDOmgiiKQnWxtkWhm36L6UdtZZmUwlSmhe2/Otjneeh96B1uX8h+/aph1J3iE0
         WyfAfYwb1H5jyO6AkUKCkspkLPTiU+EdIs0PuZZ7rTA0d6g4EJ05ynWwSY7TUKv1VjI8
         zIdB1Brf0mSKAOBOGdMVQsGnYKZdLw4glQRyDTVgG94q1a0zLSdtnhbrPhf3tvzDCJD3
         TKuhmcEzR7gvlPWtt7ZM+g1kHXEChY8hAcXXX3DRPoNQyOy0mhkmqLrCkjl0z16WakbS
         oaDg==
X-Gm-Message-State: AOJu0YzGE/ygkOsvAlDcXiKkVnHQ1sF5K2xOOa5Up4EFwynzmdjY6DtJ
	Zlp1xNgu17kquvseGy4mGDE=
X-Google-Smtp-Source: AGHT+IFbAoW9W2PdEOD1ZG3Y5Jdg8Huktr2PW0pZvtNdE4YOHhy9bT6rt9+9ggkk3Kg3QbYZo4nMsg==
X-Received: by 2002:a17:902:6507:b0:1d3:b609:eb0b with SMTP id b7-20020a170902650700b001d3b609eb0bmr15941584plk.27.1703926789844;
        Sat, 30 Dec 2023 00:59:49 -0800 (PST)
Received: from localhost.localdomain ([154.220.3.115])
        by smtp.gmail.com with ESMTPSA id y18-20020a170902b49200b001d4ab6f0a5csm493914plr.230.2023.12.30.00.59.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 30 Dec 2023 00:59:49 -0800 (PST)
From: zhouzhouyi@gmail.com
To: paulmck@kernel.org,
	akiyks@gmail.com,
	perfbook@vger.kernel.org
Cc: Zhouyi Zhou <zhouyi.zhou@ucas.com.cn>,
	Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: [PATCH -perfbook] toolsoftrade: fix a typo: manpages should be man pages
Date: Sat, 30 Dec 2023 16:59:29 +0800
Message-Id: <1703926769-5124-1-git-send-email-zhouzhouyi@gmail.com>
X-Mailer: git-send-email 1.7.1
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>

From: Zhouyi Zhou <zhouyi.zhou@ucas.com.cn>

According to [1][2], manpages should be man pages or man-pages.

[1] https://en.wikipedia.org/wiki/Man_page
[2] https://www.kernel.org/doc/man-pages/
Signed-off-by: Zhouyi Zhou<zhouzhouyi@gmail.com>
---
 toolsoftrade/toolsoftrade.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 645ee74b..097c18d6 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -308,7 +308,7 @@ Parent process sees x=0
 	(such as \co{mmap()} and \co{shmget()}).
 	In the meantime, there are any number of textbooks that cover
 	these primitives in great detail,
-	and the truly motivated can read manpages, existing parallel
+	and the truly motivated can read man pages, existing parallel
 	applications using these primitives, as well as the
 	source code of the Linux-kernel implementations themselves.
 
-- 
2.34.1

