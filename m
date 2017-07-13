Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=6p69QRW8uBpg9wCU7EIdRiLRdp3uKUVdsaivDn7S/4Y=;
 b=k3LxyHMh93E9umwo1GImRu5jp93wBOh8I7LcStWGnM61NS27x8U6UTknYPDYw6JdkM
 o6Qagdd0h9Q/5fOz+yiyeC5TUhkOXLavLw1PPOwHkw/VTJGtGIRhqZ30QiaZtKzU/tq6
 8T0XE1u9o7EQUtLk44tyl6o+dbjyjLe6WdSxJPSPWGIZRrOEtjdKGgNWehxt4hfssbfI
 maPSTNibB2rV0kF0AOonNRGkSiXsuDzpVJDNhA3H1LmAxXwLsmR3tUkeyLedQ914yyy6
 OX7au8uvZUQbTqxGaJnUWbbVIu1LtNC0qb534NQrbjbCW8eBo++y32H9A2SWJlt59Ttd
 1r4w==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 1/2] future/QC: Fix typos
Date: Fri, 14 Jul 2017 08:19:22 +0900
Message-Id: <20170713231923.4929-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 future/QC.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/future/QC.tex b/future/QC.tex
index d16c080..f985437 100644
--- a/future/QC.tex
+++ b/future/QC.tex
@@ -411,7 +411,7 @@ ten digits of precision.
 If this was all that QC provided, QC would be a rather slow and very
 low-quality analog computer.
 Given that digital computers obsoleted analog computers some decades back,
-This analogy might lead many developers to ignore QC and to
+this analogy might lead many developers to ignore QC and to
 use classic-computing floating point instead.
 However, QC provides a powerful capability covered in the next section.

@@ -798,7 +798,7 @@ For example, perhaps machine-learning techniques will allow difficult
 cases to be detected so that alternative solution methods can be applied
 as needed.

-Of course, much of this work has been heuristic and/or probabalistic,
+Of course, much of this work has been heuristic and/or probabilistic,
 so it might at first glance seem unfair to compare them to
 QC algorithms.
 However, QC algorithms are inherently probabilistic due to error rates
-- 
2.10.0

