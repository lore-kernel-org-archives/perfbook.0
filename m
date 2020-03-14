Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:39128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727938AbgCOCYO (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sat, 14 Mar 2020 22:24:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584195022;
        bh=IwMdJo4TmnrohbiB4o/iMT7KNTbxhHk4EYV7ZwHPtbM=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=rSbnc7sONGkx7zQH9XHkWSg06CnPGfIkMh+6gO1gxETIhPYG+uoNeGeDVgLUSX5db
         3uh9eVK3ZJw4DKyhafM4ZiYxOLQaL2mibIRUUKo63ifELAe4/YT3PRwAywTAsCAPBA
         KT3VsQEtGfRDeWJhS0s/AyyXwWhGyfjUMFwZxufo=
Date: Sat, 14 Mar 2020 07:10:21 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] bib: Update the AMD GPU compute URL
Message-ID: <20200314141021.GL3199@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20200313110816.8735-1-bp@alien8.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200313110816.8735-1-bp@alien8.de>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: perfbook@vger.kernel.org

On Fri, Mar 13, 2020 at 12:08:16PM +0100, Borislav Petkov wrote:
> From: Borislav Petkov <bp@suse.de>
> 
> The old one is 404.
> 
> Signed-off-by: Borislav Petkov <bp@suse.de>

Applied, good catch, and thank you!!!

I leave the old entries around due to this bib directory deriving from
my main one, so if I rebuild an old paper, I have information telling
me what new entry to use.  So I took the liberty of modifying your patch
as shown below.  Please let me know if I messed anything up.

							Thanx, Paul

------------------------------------------------------------------------

commit e0424415203223af69bceaa6062e3c91628b2c01
Author: Borislav Petkov <bp@suse.de>
Date:   Fri Mar 13 12:08:16 2020 +0100

    bib: Update the AMD GPU compute URL
    
    The old one is 404.
    
    Signed-off-by: Borislav Petkov <bp@suse.de>
    [ paulmck: Updated to leave old entry as tombstone for other documents. ]
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/bib/hw.bib b/bib/hw.bib
index 9ff3434..4f6dcbe 100644
--- a/bib/hw.bib
+++ b/bib/hw.bib
@@ -170,7 +170,15 @@ System Programming",
  Title="{OpenCL\textsuperscript\texttrademark} Zone---Accelerate Your Applications",
  year="2017",
  month="January",
- note="\url{http://developer.amd.com/tools-and-sdks/opencl-zone/}",
+ note="\url{http://developer.amd.com/tools-and-sdks/opencl-zone/} (Obsolete, see bibentry AMD2020ROCm)",
+}
+
+@unpublished{AMD2020ROCm,
+ Author="AMD",
+ Title="Professional Compute Products - {GPUOpen}",
+ year="2020",
+ month="March",
+ note="\url{https://gpuopen.com/professional-compute/}",
 }
 
 
diff --git a/howto/howto.tex b/howto/howto.tex
index 39356ee..b418914 100644
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
index ed0ec4f..908dc56 100644
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
