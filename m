Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=p8ayBbRbCuFt5BhJnHLirLjLA75WcWKjI7d7kKvul14=;
        b=qASQUpowhmPcYZq1FasfLZUpU+O2tR499nwOjXsJX0lAFZzvzc1EywR8AQypSVAME5
         tqIdmaO+ofe+4eeCYAoK4wo59O1cuMqWhPnph8ClDUERcsCVs0hxn3eFrictnVKGuTOT
         taXO/cAlDUafVFxWFC7LREaGzH+VAsu8yGqyLzL27OUj1ymcTeUieCIgi6TN+L5oCg8A
         XZ4W9UCUQuSn1itMPtskScYbOZWXWgeRRjOMbYTheoz6HQ+MRmDDjK+wMQTdkDG1kPtc
         kkRs8jZWgH8eXTKWEFhlMvJAyA4e9zVJxdupcE29ZPVwVmxcI04jFgbSXieLjw6JO22p
         hXgQ==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 3/5] defer/rcuapi: Consistently use dashes for 'RCU-protected' and 'update-side'
Date: Fri, 26 Apr 2019 09:57:02 +0900
Message-Id: <20190426005704.10952-4-sj38.park@gmail.com>
In-Reply-To: <20190426005704.10952-1-sj38.park@gmail.com>
References: <20190426005704.10952-1-sj38.park@gmail.com>
To: paulmck@linux.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Only one sentence is not placing a 'dash' between two words: 'RCU
protected' and 'update side'.  This commit adds dashes for better
consistency.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 defer/rcuapi.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index 6e014e0..72aa10c 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -578,8 +578,8 @@ prior to the corresponding \co{rcu_assign_pointer()}, even on Alpha CPUs.
 On non-Alpha CPUs, \co{rcu_dereference()} documents which pointer
 dereferences require RCU protection.
 
-Another situation where protection is not required is when update side code
-accesses the RCU protected pointer while holding the update-side lock.
+Another situation where protection is not required is when update-side code
+accesses the RCU-protected pointer while holding the update-side lock.
 The \co{rcu_dereference_protected()} API member is provided for this
 situation.
 Its first parameter is the RCU-protected pointer, and the second
-- 
2.10.0

