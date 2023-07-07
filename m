Return-Path: <SRS0=XIzw=CZ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688731690; x=1691323690;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RUiMSCR2hlrw3N5B8RuP1j2NBg3qZkSLqguGvnEnECk=;
        b=r1RZYvHCgaf5YGIs2Tx9otgF5TuulfgI+Vd3OmPMYZf0FKb57KEuBqcP9IdrtQztor
         gxeRmMka0C8al9+/SPHCUCVV9+40OtJEOlOYL8iuchW0HV+sPb3lzNG3Aaj/SL9Eal03
         7gqgUWhhe9INFBKb4PaRdiiYWYqnxYZR3iIXxXaEbe7GVGjDUkFqdkMWIUMvTti55Hbs
         RKYbUWWfUcs4Skiyg5B+lO25Rsd8wSzrI7LryFQKdBmjnNJnGTU8NonqUpUjrqb22nIB
         UCZmrzKnS4iThROYeBEsaoWRJGDqSrJNgsmLDT58A4MUKAbALhyrbc2lYWgySMYpMAN/
         MjMg==
Message-ID: <b56fa86e-aaea-dd69-b640-8ab920a19816@gmail.com>
Date: Fri, 7 Jul 2023 21:08:06 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 3/7] Use minipage environment in \ebresizeverb
Content-Language: en-US
References: <fcac2844-3c91-c6d1-d921-5402eead1cfc@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <fcac2844-3c91-c6d1-d921-5402eead1cfc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

In Ebook-size builds, tens of warnings from varwidth are emitted:

    Package varwidth Warning: Failed to reprocess entire contents
    on input line xxx.

It turns out that this is due to the wrong use of varwidth package.
Instead, the bare minipage environment suffices in \ebresizeverb.

Stop using varwidth and get rid of those warnings.
As a bonus, we no longer need ad-hoc \vspace*{} command at the
bottom of its definition.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook-lt.tex | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 4c8870a135d9..842e0fc6b924 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -35,7 +35,6 @@
 \captionsetup[listing]{font=small,labelsep=colon}
 \captionsetup[subfloat]{font=small}
 % \usepackage{breakurl}
-\usepackage{varwidth}
 \usepackage{graphicx}
 \usepackage{rotating}
 \usepackage{setspace}
@@ -541,12 +540,11 @@
 \newcommand{\ebresizewidthsw}[1]{\resizebox{.95\textheight}{!}{#1}}
 \newcommand{\ebresizeverb}[2]{%
   \begin{lrbox}{\ebbox}%
-    \begin{varwidth}{\textwidth}%
+    \begin{minipage}{\textwidth}%
       {#2}%
-    \end{varwidth}%
+    \end{minipage}%
   \end{lrbox}%
   \resizebox{#1\textwidth}{!}{\usebox{\ebbox}}%
-  \vspace*{-7pt}%
 }
 \newcommand\ebFloatBarrier{\FloatBarrier}
 }{
-- 
2.25.1


