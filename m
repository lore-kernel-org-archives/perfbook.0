Return-Path: <SRS0=opCU=SJ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=qL2w0r+gaM+68uKVDURikq6mK82ahtDywim6wJXkuQ0=;
        b=VvbpHBO2O2eiFrs0P6tHJNTbe1T3KbHBJcO0OLGHqi26M+fTkY7cQQmgY26w6CwKsw
         v2uoj4LAqLHBUarV7cXYuXnl9lFA/HBtmoyLxyouE63llSYVMxoQm3SSClgopvG6FDBc
         7MXTi1tTs19jIwoXKF9q8oVVK+AMgUPCJw2AHicaSXvG4xulvw05hIsDsnPE4KkY+6v5
         hRuP6iYE7aksIpew7vOKnXFMAliPCYg7yBvpP+RG7leQlnmQHtOQ+4byXM+26SYlqZlM
         UCLrXU2qrldyDIEr65eL4POrCUFm+VCeYtLfDOil1QDgPlMyoNHufAlGwtvJtlnv/qYc
         xU7A==
Message-ID: <4499162d-b106-48dd-0533-af13247a48da@gmail.com>
Date: Tue, 25 Jan 2022 19:08:23 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 5/6] debugging: Add indexing tags to
 '(anti-)heisenbug'
Content-Language: en-US
References: <5baa07e6-7936-4d3a-d2be-75508899f8ac@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <5baa07e6-7936-4d3a-d2be-75508899f8ac@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Note: Use the \IXBalth{}{}{} macro as \IXBh{anti-}{heisenbug}
would put a space between the two arguments in the text.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 debugging/debugging.tex | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index 13a3c59b..fbe581f7 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -1660,7 +1660,7 @@ of a bug appearing, which
 is why extremely lightweight tracing and assertion mechanism are
 so critically important.
 
-The term ``\IX{heisenbug}'' was inspired by the \pplsur{Weiner}{Heisenberg}
+The term ``\IXB{heisenbug}'' was inspired by the \pplsur{Weiner}{Heisenberg}
 \IX{Uncertainty Principle} from quantum physics, which states that
 it is impossible to
 exactly quantify a given particle's position and velocity at any given
@@ -1683,7 +1683,8 @@ more easily reproduced!
 If the field of physics inspired the name of this problem, it is only
 fair that the field of physics should inspire the solution.
 Fortunately, particle physics is up to the task:
-Why not create an anti-heisenbug to annihilate the heisenbug?
+Why not create an \IXBalth{anti-heisenbug}{anti-}{heisenbug}
+to annihilate the heisenbug?
 Or, perhaps more accurately, to annihilate the heisen-ness of
 the heisenbug?
 Although producing an anti-heisenbug for a given heisenbug is more an
-- 
2.17.1


