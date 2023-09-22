Return-Path: <SRS0=7RMV=FG=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695390861; x=1695995661; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EQqCbQLz6R19OE5JkWhuIOZhd2Vbc/azVkS9O0GVD1E=;
        b=GZMWuI2fqG+3lONsLXZuzzjTPhWYq2zry46XSVUpHq9sxQwmY42ZALSB2EaaMVVUGo
         21v25of5RCL7WOWbEwplxXzVpxb349I7vyyOmOx7tP+OBj9KIh8BQrgeFHPogzoJOb3y
         qQGYOS3CTAVYdUhab1PYQehVXUMHwYWZj4SbnKKSvOonW1Y+RmzdcLqPLAJf4QZxkADy
         XYkPnQzUsr18zgWtD8JTDm3msxd/fOlwhIVRHQgjp4ckfXQAH/vvTctZadEkMOcXS8D/
         Beid9oWb7oOycMAfHT3EzWDkalYk7knnLmTNvW4IKEHfUn48OCB2asNorolqYJbFr1VA
         fcOg==
Message-ID: <c4a4e063-f470-aa33-707f-c1a31910b435@gmail.com>
Date: Fri, 22 Sep 2023 22:54:18 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 1/4] memorder: Add index markers for
 'address/control/data dependency', take 1
Content-Language: en-US
References: <f16891e8-6d60-327a-0d2d-4bb3cb04899e@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <f16891e8-6d60-327a-0d2d-4bb3cb04899e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Add index markers of bold face for "address dependency", "control
dependency", and "data dependency" at their corresponding sections
in memorder.

(hierarchical form)

    - Dependency
          address
          control
          data

  with additional "see xxxx" entries as follows:

    - Address dependency, see Dependency, address
    - Control dependency, see Dependency, control
    - Data dependency, see Dependency, data

(flat form)

    - Address dependency
    - Control dependency
    - Data dependency

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 indexsee.tex          | 3 +++
 memorder/memorder.tex | 6 +++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/indexsee.tex b/indexsee.tex
index bd82fa1debfd..a77e9d642824 100644
--- a/indexsee.tex
+++ b/indexsee.tex
@@ -1,3 +1,4 @@
+\index{Address dependency|see{Dependency, address}}
 \index{Anti-Heisenbug|see{Heisenbug, anti-}}
 \index{Associativity|see{Cache associativity}}
 \index{Associativity miss|see{Cache miss, associativity}}
@@ -8,6 +9,8 @@
 \index{Capacity miss|see{Cache miss, capacity}}
 \index{Code locking|see{Locking, code}}
 \index{Communication miss|see{Cache miss, communication}}
+\index{Control dependency|see{Dependency, control}}
+\index{Data dependency|see{Dependency, data}}
 \index{Data locking|see{Locking, data}}
 \index{Direct-mapped cache|see{Cache, direct-mapped}}
 \index{Exclusive lock|see{Lock, exclusive}}
diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 86bb8f41b5f8..9610618b41f4 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -1815,7 +1815,7 @@ thus preventing the \co{exists} clause from triggering.
 \subsection{Address Dependencies}
 \label{sec:memorder:Address Dependencies}
 
-An \emph{address dependency} occurs when the value returned by a load
+An \emph{\IXBh{address}{dependency}} occurs when the value returned by a load
 instruction is used to compute the address used by a later memory-reference
 instruction.
 This means that the exact same sequence of instructions used to traverse
@@ -2028,7 +2028,7 @@ be fragile and easily broken by compiler optimizations, as discussed in
 \subsection{Data Dependencies}
 \label{sec:memorder:Data Dependencies}
 
-A \emph{data dependency} occurs when the value returned by a load
+A \emph{\IXBh{data}{dependency}} occurs when the value returned by a load
 instruction is used to compute the data stored by a later store
 instruction.
 Note well the ``data'' above:
@@ -2104,7 +2104,7 @@ compiler from breaking them.
 \subsection{Control Dependencies}
 \label{sec:memorder:Control Dependencies}
 
-A \emph{control dependency} occurs when the value returned by a load
+A \emph{\IXBh{control}{dependency}} occurs when the value returned by a load
 instruction is tested to determine whether or not a later store instruction
 is executed.
 In other words, a simple conditional branch or conditional-move
-- 
2.25.1


