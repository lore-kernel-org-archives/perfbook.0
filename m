Return-Path: <SRS0=Ar/J=QR=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=kb1iNkz16HHZbW59yrV5wqhswEvXS1ezElTlOWhS1PQ=;
        b=TpRGI2dUcXsiQQgPjhT7Hw34xPdYPo+DDnhnWDHfHcTklbzLewV0Cj7NLjnhoroVVy
         5sa96RI1Yt0mvXLsxuuGVDMYoCEtuc2w6Nhuu7mkUImUJu1V9CfP9+VStghtzQ4kTOnU
         ACyCOIWgszNcKCiYr6UNrKmTxaAat+vlCnaetJGckUAHzSkGUEj0bKRT92TcsNdkSmPm
         vEn8cm6ugzz0T8PTPkjozkE5VUVu6taX9ZJ7tK3RKYlSqvfoxjoMcSg5lJb/EysE+qkR
         y2vzVscafbz1pH2e4tIzLh2ggcww/7ab1b4TTabd3x7ZEOxJeVRr51kVJxFp7Y2YYJVK
         Jn7Q==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] defer/rcuusage: Tweak width of Figure 9.23 for 1c
 builds
Message-ID: <dd3981bd-fcee-e488-ad45-5ff55aa7d80a@gmail.com>
Date: Tue, 30 Nov 2021 11:26:06 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Width of 5.5in does not fit in eb and 1c builds.
The width of .96\textwidth works for both of them.

Note:
    Strictly speaking, 1c builds don't need the scaling factor of .96.
    But an additional conditional for them would not change the result
    so much.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuusage.tex | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index e4c478f1..bc0d8778 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -201,7 +201,12 @@ that of the ideal synchronization-free workload.
 
 \begin{figure*}
 \centering
-\resizebox{5.5in}{!}{\includegraphics{defer/RCUusecases}}
+\IfTwoColumn{
+  \resizebox{5.5in}{!}{\includegraphics{defer/RCUusecases}}
+}{
+  \resizebox{.96\textwidth}{!}{\includegraphics{defer/RCUusecases}}
+  % eb builds require .96
+}
 \caption{Relationships Between RCU Use Cases}
 \label{fig:defer:Relationships Between RCU Use Cases}
 \end{figure*}

base-commit: 7d9743376122167a9cdd9acc0decfe41e17a2a93
-- 
2.17.1

