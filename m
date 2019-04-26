Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=fqiE1mrC4yKc2ZhH7eiwEjSdz9colucOqsRXGNRmUbU=;
        b=D6UIQJsgi+vkXzmxZ+AapoSDn0NClDVgJvkSrtu6SrmHoVbwUpmCisR6wiacdTMZQQ
         JI+GUNRT0ZJ6m4iV1Drz7P4SqK/FM6ruGqqZ2g9R9EfeS4g9YKqeRpZgEkN4LbMdC7iu
         /MOnYeaF3DzS3cFrjY12J8ACu3bDnQcRkfD4VeUIS+8e7G5pGkaA+Tjesof+nKGVi0Uu
         PRFAEqgH3tLObgiRLyl63EUbCeXtMgVLV2VxWAJibLOlw+uVT8ZKbXJqd/Wvmf9h3gqc
         +SkdYZJan60RPzFPQ/IuigbvhflWYAPwVKaUq84omqayufRqLkLktYyqwQHX/zTcBIvl
         UlXQ==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 2/5] defer/rcupai: Fix a typo: _pointer()() -> _pointer()
Date: Fri, 26 Apr 2019 09:57:01 +0900
Message-Id: <20190426005704.10952-3-sj38.park@gmail.com>
In-Reply-To: <20190426005704.10952-1-sj38.park@gmail.com>
References: <20190426005704.10952-1-sj38.park@gmail.com>
To: paulmck@linux.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 defer/rcuapi.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index 93b9767..6e014e0 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -570,7 +570,7 @@ Again, simply loading these pointers using C-language accesses
 could result in seeing pre-initialization garbage in the pointed-to data.
 However, if the pointer is merely to be tested and not dereferenced,
 this protection is not needed.
-In this case, \co{rcu_access_pointer()()} may be used.
+In this case, \co{rcu_access_pointer()} may be used.
 Normally, however, protection is required, and so the
 \co{rcu_dereference()} primitive ensures that subsequent code
 dereferencing the pointer will see the effects of initialization code
-- 
2.10.0

