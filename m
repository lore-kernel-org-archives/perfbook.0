Return-Path: <SRS0=4wRT=KD=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Bf+rtp327hdNww0Ld1gvgmxQimEn0lKXlO1ZxYEBDu8=;
        b=U3XQ312XzMuL+/AEC4d04px+1Q3p382aIMxvuCFzZV62RIEeZPuPFl3im6jkLK7Gpg
         X3LnHsqOefmw7UYGSO3aw4O0o4ZVomb2aQ9t3HDdHal0GEOzAX7ZKe2PzbkDiYY+PVPm
         6qRkDQepeqP6+fbWeh1ey7Mx/3uEriDx1LjDnioZOgjJX8eRAd/e/t1i62ei2oJKyTIq
         4Q0GBlW4tI7m3XA6/VtX9LrJLp5ShD29A8n4lsKuBfsO5eR6MWDa04NP63xYbnbMCiG9
         +VgLfcJT3QgrXIuerAn/5rps12GzjWdPLJ0bcvXVZXfrJzlPdxZ3uVGLjahJxc2wTE3p
         CE3g==
Subject: [PATCH -perfbook 4/4] perfbook-lt: Customize reference style of
 equation
References: <d66be1a7-9ef3-bf69-de15-2a684894bc12@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5e325fda-41a1-be91-1ae0-62f685529866@gmail.com>
Date: Sat, 8 May 2021 16:10:20 +0900
MIME-Version: 1.0
In-Reply-To: <d66be1a7-9ef3-bf69-de15-2a684894bc12@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

As a PoC, Customize setting so that \Cref{} expands to "Equation~m.n"
and \cref{} expands to "Eq.~m.n".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook-lt.tex | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 6e7d8d1f..9e30a1a4 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -310,6 +310,8 @@
 \Crefname{sequencei}{Step}{Steps}
 \crefname{page}{page}{pages}
 \Crefname{page}{Page}{Pages}
+\Crefformat{equation}{Equation~#2#1#3}
+\crefformat{equation}{Eq.~#2#1#3}
 \newcommand{\crefrangeconjunction}{--}
 \newcommand{\creflastconjunction}{, and~}
 
-- 
2.17.1


