Return-Path: <SRS0=KFAY=RZ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RbAx6Ogj63XEfEOvH3hkxVK8pnBvENWLF4NOInuvyVY=;
        b=LuaKQ1vQV5bubVrCDp48R33a9FJHy+Wv0Y/QbwTxcR5r7QXwKXG2aOdJXzg1h7ff/0
         t9gKNsCtttGJsXpKuK9dvLz9nAJc+L88H9XubEnAOQs01OtVoXa3fIUxO4M/XymCPHse
         tLwdKSIt5KJ80IQrgJ5Gtsb4XCSNxuIgyN6bvulIsAxnW8SJlPx0hzK8uPOWqfe9VVq4
         7FdlvL57acphMSgzw3/3K/IfG8wxQZLB7sfiDJ/FUBXpK+A8MZAOjtNoFUzla8cg8i0E
         TZmsJp5YhpNGyWDbEWC6+k1DqeT9OfJFela70ELAvWTlEmCwkbZvseNZJXGkE8Ptgfw0
         JxPg==
Subject: [PATCH -perfbook 4/4] defer/rcuintro: Use nbsp around short numbers
References: <abc09d03-49ca-5350-0681-27e6a0e43ef3@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <079edcf2-7222-2e64-5bd5-d0e015dd1e13@gmail.com>
Date: Sun, 9 Jan 2022 09:02:00 +0900
MIME-Version: 1.0
In-Reply-To: <abc09d03-49ca-5350-0681-27e6a0e43ef3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuintro.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
index bb79ec0b..52a52ca8 100644
--- a/defer/rcuintro.tex
+++ b/defer/rcuintro.tex
@@ -95,9 +95,9 @@ Again taking the lessons from
 to heart, \co{smp_store_release()} is used to \co{NULL} the pointer,
 thus moving from the first row to the second in the figure.
 At this point, pre-existing readers see the old structure with
-\co{->addr} of 42 and \co{->iface} of 1, but new readers will see
+\co{->addr} of~42 and \co{->iface} of~1, but new readers will see
 a \co{NULL} pointer, that is, concurrent readers can disagree on
-the state, as indicated by the ``2 Versions'' in the figure.
+the state, as indicated by the ``2~Versions'' in the figure.
 
 \QuickQuizSeries{%
 \QuickQuizB{
-- 
2.17.1


