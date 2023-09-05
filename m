Return-Path: <SRS0=DNQX=EV=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693927914; x=1694532714; darn=kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+W5m2OO2lO30XhNaxt4jbuSt2IIlyS8UUKJ4gbnPodo=;
        b=GDTq2ju4cQZu6TXkYTm5gBzl913M/O6t2+7tfUcxPUEXqKYAlVXImGZTMwW6Xb0+Yr
         b5RAO9/ALBJm0gJHHUbJjD2KvwuQw3ZkCtCeMtWQ3zRQji6763tJp74xQEYYwid2YuA1
         jO/vnvhG5UqPiOX1/1eGUi4k3vI+p1+rsV5KbcjhJiVZw9Lon9jVAaPcIo+ij5VqHARu
         1V3Nz0uYZvfVJHhs1l3IkARLbMAUtneacAH4pAE80q0uAc12fOpBaiyfqFF2hYisO2uj
         ikpcQ2QYKB72gn5JaJizRrn3vfp+M9Seq9LY1Ot49suoFJmDaR+qwkHibzyb8a0glemv
         dO2A==
Message-ID: <7e94e14d-ae5e-16ad-7476-8d5bf764b450@gmail.com>
Date: Wed, 6 Sep 2023 00:31:50 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] Use margins/indents for twocolumn as defined in
 book class
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

In perfbook.pdf, patches shown in Section 12.1.6.8 exceed the boxes
surrounding them.  Bisection points at commit 1063ddafb476 ("Get rid of
'twocolumn' option in \documentclass").

It turns out that there are a couple of indent and margin settings
the geometry package does not take care of.

Here is a list of such length parameters:

    - \parindent
    - \leftmargini
    - \leftmarginv
    - \leftmarginvi

Those length are set shorter for the twocolumn option in book.cls
and bk10.clo.

Restore the previous behavior by explicitly setting them for twocolumn
builds.

Fixes: 1063ddafb476 ("Get rid of 'twocolumn' option in \documentclass")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook-lt.tex | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 9c89dd4254b8..3adf512effcb 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -478,6 +478,11 @@
     }{
       \usepackage[letterpaper,body={6.5in,8.25in},twocolumn,columnsep=0.25in]{geometry}
     }}
+  % Adjust indents/margins set in book.cls for twocolumn
+  \setlength{\parindent}{1em}
+  \setlength{\leftmargini}{2em}
+  \setlength{\leftmarginv}{.5em}
+  \setlength{\leftmarginvi}{.5em}
   \sloppy % prefer wide inter-word spaces to occasional horizontal overfulls
 }{ % One Column
   \IfEbookSize {

base-commit: c9250f8d67fe9cdbaf6c25c27a395df48116a041
-- 
2.25.1

