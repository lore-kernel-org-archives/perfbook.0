Return-Path: <SRS0=a2rp=N7=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SKqmIPMjonJEp9X8XDLJfzOWB0xwgk282AGvNb0fRmk=;
        b=WBFhFywXRBAl9oIdLZJO0ahxhnU0f/2RRemL9nmbzy5L1HfWR5C4G8llz4S1R3GieJ
         V9rfdtdImGBlOqShPM8/51Ga15VynoG/qV7NXmk6MSLITA0SG1LIV5CTibyGkycL+nSH
         xJk1zrh2fHbMTKzaBqe2NMzfSv61AVWxFDN/sKaCi862FbyN5BagE3PRWhdNyJblJl5E
         KRAQafFQaRsF693tTLCs+2g7w/Ih2Jq7+8tODoSEz1SlSz0Z7Y+itTCjvysETeVi1E2Q
         v2in6MMajWBndShzBQhWYipWUvt+At3zEFiVsiV7xb2uiMzS+4k6GFa6kE627jzv2F2G
         rKPA==
Subject: [PATCH -perfbook 2/2] formal: Use symlink to .eps file under
 CodeSamples/formal/data
References: <cda34cf6-0201-2b80-13de-afa13a1fd02c@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <f5a30986-d214-fdc7-c11c-e7727de93d8b@gmail.com>
Date: Thu, 9 Sep 2021 13:16:00 +0900
MIME-Version: 1.0
In-Reply-To: <cda34cf6-0201-2b80-13de-afa13a1fd02c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This is a preparatory change of planned reduction of conversions
from .eps to .pdf.
The goal is to exclude unused plots under CodeSamples/ from conversions
by a2ping.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/RCU-test-ratio.eps | 1 +
 formal/formal.tex         | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)
 create mode 120000 formal/RCU-test-ratio.eps

diff --git a/formal/RCU-test-ratio.eps b/formal/RCU-test-ratio.eps
new file mode 120000
index 00000000..ebba3220
--- /dev/null
+++ b/formal/RCU-test-ratio.eps
@@ -0,0 +1 @@
+../CodeSamples/formal/data/RCU-test-ratio.eps
\ No newline at end of file
diff --git a/formal/formal.tex b/formal/formal.tex
index 55a5ed98..ba52da88 100644
--- a/formal/formal.tex
+++ b/formal/formal.tex
@@ -318,9 +318,9 @@ can help reduce the cost of finding and fixing any bugs located.
 \begin{figure}
 \centering
 \IfEbookSize{
-\resizebox{\onecolumntextwidth}{!}{\includegraphics{CodeSamples/formal/data/RCU-test-ratio.pdf}}
+\resizebox{\onecolumntextwidth}{!}{\includegraphics{formal/RCU-test-ratio.pdf}}
 }{
-\resizebox{4.5in}{!}{\includegraphics{CodeSamples/formal/data/RCU-test-ratio.pdf}}
+\resizebox{4.5in}{!}{\includegraphics{formal/RCU-test-ratio.pdf}}
 }
 \caption{Linux-Kernel RCU Test Code}
 \label{fig:formal:Linux-Kernel RCU Test Code}
-- 
2.17.1


