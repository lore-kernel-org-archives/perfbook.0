Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZE6k/MUqot2QY2JmxGXJycR4Rp4ezN0pclnyq4rcxEM=;
 b=QRgzKxZB5tbdlug7r8HCN+beQbsg4zaMx5Z6MvvI7TvwYafrf5kDgh7hn763+seq/c
 UDi6pYSp71MXzD3C1CpjKzSQdsHQdQbr0GkKot6PHZo2/s476jW1jhFlUl/uU+f61vva
 7+orm7KHAgM46aXx1YJm1Z9IMMEwHTFDyWHdnhABNRIzAYGN7R/PX0x2kmtAuqsIhhjb
 pbF+qVF9HCUeowAfIRaGd9jfX+kRglGmqDubN4hrMRIDOfIZKILfJwmEw1JtvvrFtZVe
 QrsuGcdUXsQAJEXn9N/EWMOH0YQDieMoWdEmcJ4gU4cT5dkqZJdPoYopmwYoSWBDH+5t
 HDvg==
Subject: [PATCH 2/3] CodeSamples/formal: Remove 2nd parentheses in tests under
 herd/
References: <d39e4d4f-4c4a-b72a-0fcf-8e244aa91c1e@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <f2443ee4-ac2e-bf81-ec64-5329516f0a68@gmail.com>
Date: Sat, 11 Nov 2017 08:40:30 +0900
MIME-Version: 1.0
In-Reply-To: <d39e4d4f-4c4a-b72a-0fcf-8e244aa91c1e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 89710e2fb5d2692ed9b3912d907c9fc4bd15ba3e Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 11 Nov 2017 01:08:35 +0900
Subject: [PATCH 2/3] CodeSamples/formal: Remove 2nd parentheses in tests under herd/

These are incompatible with "herd7" command.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-C.litmus  | 4 ----
 CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-CE.litmus | 4 ----
 CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-X.litmus  | 4 ----
 CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-XE.litmus | 4 ----
 CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u.litmus    | 4 ----
 5 files changed, 20 deletions(-)

diff --git a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-C.litmus b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-C.litmus
index cee5912..ae64726 100644
--- a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-C.litmus
+++ b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-C.litmus
@@ -3,10 +3,6 @@ C C-SB+l-o-o-u+l-o-o-u-C
 {
 }

-{
-#include "api.h"
-}
-
 P0(int *sl, int *x0, int *x1)
 {
 	int r2;
diff --git a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-CE.litmus b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-CE.litmus
index b331740..1e2dd5b 100644
--- a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-CE.litmus
+++ b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-CE.litmus
@@ -3,10 +3,6 @@ C C-SB+l-o-o-u+l-o-o-u-CE
 {
 }

-{
-#include "api.h"
-}
-
 P0(int *sl, int *x0, int *x1)
 {
 	int r2;
diff --git a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-X.litmus b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-X.litmus
index e8c489d..30a7fe7 100644
--- a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-X.litmus
+++ b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-X.litmus
@@ -3,10 +3,6 @@ C C-SB+l-o-o-u+l-o-o-u-X
 {
 }

-{
-#include "api.h"
-}
-
 P0(int *sl, int *x0, int *x1)
 {
 	int r2;
diff --git a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-XE.litmus b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-XE.litmus
index 51aa67b..28a0f83 100644
--- a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-XE.litmus
+++ b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-XE.litmus
@@ -3,10 +3,6 @@ C C-SB+l-o-o-u+l-o-o-u-XE
 {
 }

-{
-#include "api.h"
-}
-
 P0(int *sl, int *x0, int *x1)
 {
 	int r2;
diff --git a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u.litmus b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u.litmus
index c7df045..c16d8f9 100644
--- a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u.litmus
+++ b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u.litmus
@@ -3,10 +3,6 @@ C C-SB+l-o-o-u+l-o-o-u
 {
 }

-{
-#include "api.h"
-}
-
 P0(spinlock_t *sl, int *x0, int *x1)
 {
 	int r1;
-- 
2.7.4


