Return-Path: <SRS0=gYOr=7K=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679182967;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1VXu90taE0VCUPyHRF2NLGEhjdJr9cVnk9939fLMfkA=;
        b=HQgdIAg1+5FoyFvu3rgUiyEXEnpDmzXEG41NPftHYmMH1enBL1dcBXMkcUwm+oTGhA
         R8nHU1H0inGatxqmMuvSzg4q/RCglZQE3/ag+zS1dTh0EZtkDLWGKhWHdaUNgK1ubvR8
         uX51UYeOVctsU1vaCPS1rD70rn5FswIBo9hdZ5Nw/3r3vsqsHWb0VPZjNqF0ikJ2wj9E
         t69BKzCnhS7MqqoFfD4uNw6r3I+bzg5d9rhXg5IUbW2Hz/lGMiNzeFOKMs1IUXeLPwpD
         a6/iB77MRloSCeNYEKy7l1cMpieLMggD31qowvuRuqis8UYVepu5CwZBWtKqzQDc0Q8L
         DvTg==
Message-ID: <3c4e6627-72cb-dca4-41b6-9704cc144910@gmail.com>
Date: Sun, 19 Mar 2023 08:42:43 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 2/3] Stop loading fixltx2e
Content-Language: en-US
References: <475eb10b-a10c-a3ec-0651-b122f00bdff0@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <475eb10b-a10c-a3ec-0651-b122f00bdff0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

As is mentioned in the trailing comment and a warning in the log:

  Package fixltx2e Warning: fixltx2e is not required with releases after 2015
  (fixltx2e)                All fixes are now in the LaTeX kernel.
  (fixltx2e)                See the latexrelease package for details.

, it should be safe to comment it out in 2023.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook-lt.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index efb49bd0abe7..7239d2350477 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -22,7 +22,7 @@
 \UseMicrotypeSet[protrusion]{basicmath} % disable protrusion for tt fonts
 \usepackage{etoolbox}
 
-\usepackage{fixltx2e} % for \textsubscript, nop on Tex Live 2015 and later
+%\usepackage{fixltx2e} % for \textsubscript, nop since Tex Live 2015
 \usepackage{float}
 \floatstyle{ruled}
 \newfloat{listing}{tbp}{lst}[chapter]
-- 
2.25.1


