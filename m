Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.skyhub.de ([5.9.137.197]:41222 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726414AbgCMLIQ (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Fri, 13 Mar 2020 07:08:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1584097694;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:
         content-transfer-encoding:content-transfer-encoding:in-reply-to:
         references; bh=d0kwUv6Raw6fH23pVxe7U8lFsOe2/ggVTdlrhPPl0Bs=;
        b=rqwsuaBkT07buzC7q/QPM+aBU587aSL04lRVCNBqoPZLkKkNBP3wXfZYFJEizzR4kVAQgz
        msf6Y/3cwQRMm9/Pq8ga/ocE6s37qsvsNcoADOiYEcSTt1wIps8ZWgd4I2EhenPrXA7JeV
        CwYHjuPOhFp40lN2QiFTIrGExZBRGuI=
From: Borislav Petkov <bp@alien8.de>
Subject: [PATCH] bib: Update the AMD GPU compute URL
Date: Fri, 13 Mar 2020 12:08:16 +0100
Message-Id: <20200313110816.8735-1-bp@alien8.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

From: Borislav Petkov <bp@suse.de>

The old one is 404.

Signed-off-by: Borislav Petkov <bp@suse.de>
---
 bib/hw.bib      | 11 +++++------
 howto/howto.tex |  2 +-
 owned/owned.tex |  2 +-
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/bib/hw.bib b/bib/hw.bib
index 9ff34342c642..29c4bbd29432 100644
--- a/bib/hw.bib
+++ b/bib/hw.bib
@@ -165,15 +165,14 @@ System Programming",
  number="24593 rev. 3.13",
 }
 
-@unpublished{AMD2017OpenCL,
+@unpublished{AMD2020ROCm,
  Author="AMD",
- Title="{OpenCL\textsuperscript\texttrademark} Zone---Accelerate Your Applications",
- year="2017",
- month="January",
- note="\url{http://developer.amd.com/tools-and-sdks/opencl-zone/}",
+ Title="Professional Compute Products - GPUOpen",
+ year="2020",
+ month="March",
+ note="\url{https://gpuopen.com/professional-compute/}",
 }
 
-
 @manual{ARMv8Litmus2009,
  title="ARM Barrier Litmus Tests and Cookbook",
  author="Richard Grisenthwaite",
diff --git a/howto/howto.tex b/howto/howto.tex
index 39356eec5062..b4189149d0ff 100644
--- a/howto/howto.tex
+++ b/howto/howto.tex
@@ -324,7 +324,7 @@ Fortunately, there are many alternatives available to you:
 	might check out Norm Matloff's ``Programming on
 	Parallel Machines''~\cite{NormMatloff2013ParProcBook}.
 	Of course, the GPU vendors have quite a bit of additional
-	information~\cite{AMD2017OpenCL,CyrilZeller2011GPGPUbasics,NVidia2017GPGPU,NVidia2017GPGPU-university}.
+	information~\cite{AMD2020ROCm,CyrilZeller2011GPGPUbasics,NVidia2017GPGPU,NVidia2017GPGPU-university}.
 \item	If you are interested in POSIX Threads, you might take
 	a look at David R.~Butenhof's book~\cite{Butenhof1997pthreads}.
 	In addition,
diff --git a/owned/owned.tex b/owned/owned.tex
index ed0ec4f6d1bd..908dc567a4cf 100644
--- a/owned/owned.tex
+++ b/owned/owned.tex
@@ -398,7 +398,7 @@ Examples of data ownership include:
 	well-suited for GPGPUs.\footnote{
 		But note that a great many other classes of applications
 		have also been ported to
-		GPGPUs~\cite{NormMatloff2013ParProcBook,AMD2017OpenCL,NVidia2017GPGPU,NVidia2017GPGPU-university}.}
+		GPGPUs~\cite{NormMatloff2013ParProcBook,AMD2020ROCm,NVidia2017GPGPU,NVidia2017GPGPU-university}.}
 \item	Operating-system kernels adapted for networking, where each connection
 	(also called \emph{flow}~\cite{Shenker89,ZhangPhD,McKenney90})
 	is assigned to a specific thread.
-- 
2.21.0

