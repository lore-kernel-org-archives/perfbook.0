Return-Path: <SRS0=opCU=SJ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=TuBlcRUXFUju2KZ0NOlqoqFAQKf3ApAXMeKDz/zeTb0=;
        b=gbU59bztMhn4knv2YhrVDE7bUK8gqef28tSfMYnuM16ztIWrxhL8RVjYqIFXXHOOVK
         he7YiUzt5Kf4kduUytiNtn+uBXj3ReiUC/LtWrzKK2glxSuCK1yzhPfoFx1m6CLdfd6B
         H1948FRtYWD7uYO/r/Cb8YlEN1dXycFWr4tNuXBNnqipWnKKKN45W5RqQb/9ffgg1Cfr
         kR0lhofmR+ycEFM8U4iq5O1+nG0xeQVng4nFd6DOwWO3TIV28bxjzQn4xiwuqrbUDtP0
         lFZoO6hZ8uv1HrvIPEeW3buN29o5HLHWqwv2uhPne9FZH8lp4Nc+k3c80D0n6xssS6Dh
         jcQg==
Message-ID: <84b018bd-622e-c10e-74dd-f34a02e33494@gmail.com>
Date: Tue, 25 Jan 2022 19:04:44 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 3/6] memorder: Add indexing tags for historic
 lockless_dereference()
Content-Language: en-US
References: <5baa07e6-7936-4d3a-d2be-75508899f8ac@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <5baa07e6-7936-4d3a-d2be-75508899f8ac@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/memorder.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 1c6b61d9..3793c233 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -1280,7 +1280,7 @@ exists (1:r2=x0 /\ 1:r3=1)
 % ("styleguide: Loosen restriction on comment in litmus test")
 shows how to make this work reliably on pre-v4.15 Linux kernels running on
 DEC Alpha, by replacing \clnref{read}'s \co{READ_ONCE()} with
-\co{lockless_dereference()},\footnote{
+\apikh{lockless_dereference()},\footnote{
 	Note that \co{lockless_dereference()} is not needed on v4.15 and
 	later, and therefore is not available in these later Linux kernels.
 	Nor is it needed in versions of this book containing this sentence.}
@@ -1355,7 +1355,7 @@ in pre-v4.15 Linux kernels.
 	address dependencies.
 	And this is why, in Linux kernels predating v4.15, DEC Alpha
 	requires the explicit memory barrier supplied for it by the
-	now-obsolete \co{lockless_dereference()} on \clnref{deref} of
+	now-obsolete \apikh{lockless_dereference()} on \clnref{deref} of
 	\cref{lst:memorder:Enforced Ordering of Message-Passing Address-Dependency Litmus Test (Before v4.15)}.
 	\end{fcvref}
 	\begin{fcvref}[ln:formal:C-S+o-wmb-o+o-addr-o:whole]
-- 
2.17.1


