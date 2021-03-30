Return-Path: <SRS0=qWtQ=I4=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=TLZ2S9TLg+5KZD5M4owFUMSQtFbHlj6faUnOu/55hy0=;
        b=hLbQ+as13CerV7rKGqS+66QwVIeOdSyB0suzELJ8kdSe+0m2dYzkjDS0MEp/9T/RWY
         pou4e0Cigjpwl+Sxu/LOl7IdCAk8r1VZIvjUrwvWzfzHaQMjCsCPZlmxg5/xmnjBAAbY
         1oF5p7QkFrNv4+z9dpcs4hp83zw+/RXDQgjHR3awybs6YH9SHAx2qfmrivsZneyko9sk
         4yzNsA5RTjsVtPJ0ZLBZDQXGymOSxzQmBe/mcwV1KqeW9fT043g3DxdtHAyblZYQduUg
         wmfCwR0WLNSqsUASQFqgU7di0aD4kBwIebGNItbll6BXnu8PvCQotI74e1JFGUlLv2ZX
         Va7g==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] howto: Fix uneven space due to uncommented line
 break in \IfQqzChpEnd
Message-ID: <736430d2-2786-669a-9eb0-a80e66f10510@gmail.com>
Date: Tue, 30 Mar 2021 20:01:46 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

These line breaks cause extra space at

    "... found in  the final"
                 ^^

in -nq build and

    "... found in  Appendix E"
                 ^^

in the other builds.

Fix them by commenting line breaks within the macro.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 howto/howto.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/howto/howto.tex b/howto/howto.tex
index 8f06d3f3..ad63a586 100644
--- a/howto/howto.tex
+++ b/howto/howto.tex
@@ -148,12 +148,12 @@ the next section.
 
 ``Quick quizzes'' appear throughout this book, and the answers may
 be found in
-\IfQqzChpEnd{
+\IfQqzChpEnd{%
 the final section of each chapter.\footnote{
 	In the official release/edition of this book, all the answers are
 	gathered in an Appendix.
 }
-}{
+}{%
 \cref{chp:Answers to Quick Quizzes} starting on
 \cpageref{chp:Answers to Quick Quizzes}.
 }
-- 
2.17.1

