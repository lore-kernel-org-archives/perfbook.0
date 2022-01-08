Return-Path: <SRS0=SzHY=RY=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GCEDkklAFct1TG6kO7IZuW8rkA6KubIfrFmh10Nhvgc=;
        b=BMPyAhlTaNpGaDoTaOqLpmU7Xbx0dGGzbrhEGnVuzx+xxwFGUGvsFg9h6AVhJZS1lq
         AxOzwPU3k+KqwXrMTgKymfjY7Yy/HcU77v3ySYaViKGWdzMJoLSUhourKKqVO5ql+Ml+
         zjLvmX+IluBlAPVYY9VffR9poOpwQoH2aNQvthYn3OvWYDZY4gJpQNqUlcTCXh/DPhdw
         /4r5gCC+0mA4ZeFD2+pKlbMPtXDavb38ckewmBbV38lNEJRgxAFnSDFqJ++wbNyHgr8M
         KBjLDTzMyMNvlIMSfMdW35lDp0Vo54sbIdh/5ik6O529SkTwKzIUa3Va3vH0EYpxfYRo
         760g==
Subject: [PATCH -perfbook 2/4] defer/rcuintro: Use endash for pair of
 rcu_read_lock() and rcu_read_unlock()
References: <abc09d03-49ca-5350-0681-27e6a0e43ef3@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <de7cb4c5-4e31-77d8-10b5-e4876aea0086@gmail.com>
Date: Sun, 9 Jan 2022 08:58:33 +0900
MIME-Version: 1.0
In-Reply-To: <abc09d03-49ca-5350-0681-27e6a0e43ef3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Use endash for a range of things (in this case a range of code).

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuintro.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
index 39f33650..c5f2663b 100644
--- a/defer/rcuintro.tex
+++ b/defer/rcuintro.tex
@@ -197,7 +197,7 @@ The full API is covered in \cref{sec:defer:RCU Linux-Kernel API}.
 Three members of the core APIs are used by readers.
 The \apik{rcu_read_lock()} and \apik{rcu_read_unlock()} functions delimit
 RCU read-side critical sections.
-These may be nested, so that one \co{rcu_read_lock()}-\co{rcu_read_unlock()}
+These may be nested, so that one \co{rcu_read_lock()}--\co{rcu_read_unlock()}
 pair can be enclosed within another.
 In this case, the nested set of RCU read-side critical section act as
 one large critical section covering the full extent of the nested set.
-- 
2.17.1


