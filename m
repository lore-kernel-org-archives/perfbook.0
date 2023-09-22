Return-Path: <SRS0=7RMV=FG=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695391076; x=1695995876; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cAo5qPW6F8aDmcYWrO92Qb2Xu8GP8dvDe8gmAdqIbTs=;
        b=g/Swtbv89N7ftbWEgiVtnlEVxBzDMXJmLL6X/xV+E4L62UhC1qj7Chb9x7YeeBFdMP
         vPXzzErpVcia6wBXA7gFLPC9gUWV+56pwmelncYBAooTUb+x1a19zyq7cUGFzCvjvJeY
         ZWDmYYwcIo3JHh8X0JOUsoiHV3PI/mGrcLTxb/VkHXdKLAyOtPl2OH5qWM/Prsu2hjvC
         SU3mOlnVERrkmX/Fih8Ty9WyksznK4OnBXg+qZPSUf7QYCVtxp2gflDD26d52JxOKhHz
         WHvKPiy43udOHvm1L3EVI3DNwUYMTXsU341hq/qNnnYxXO09UdZ3QxEIU0m+TpQms1Bk
         58cg==
Message-ID: <132d882b-ac02-2c07-9eaa-6ca86cbe3d4b@gmail.com>
Date: Fri, 22 Sep 2023 22:57:53 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 4/4] Fix definition of \indexh for flat index pages
Content-Language: en-US
References: <f16891e8-6d60-327a-0d2d-4bb3cb04899e@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <f16891e8-6d60-327a-0d2d-4bb3cb04899e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Current definition results in random original terms appearing
in the flat index.  Fix this by using "#3 #2" (second-level term) +
(first-level term) for flat index.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook-lt.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 3adf512effcb..cddff24f1d42 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -217,7 +217,7 @@
 \newcommand{\indexhr}[3]{\indexhraw{#2}{#3}}
 \newcommand{\indexhmr}[3]{\ucindexhm{#2}{#3}}
 }{
-\newcommand{\indexh}[3]{\ucindex{#1}}
+\newcommand{\indexh}[3]{\ucindex{#3 #2}}
 \newcommand{\indexhr}[3]{\index{#1}}
 \newcommand{\indexhmr}[3]{\index{#1}}
 }
-- 
2.25.1


