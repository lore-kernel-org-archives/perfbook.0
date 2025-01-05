Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BA313C807
	for <perfbook@vger.kernel.org>; Sun,  5 Jan 2025 19:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736103732; cv=none; b=mxlPbUyMa1LgfqC0Y5bHwv+jsnDk+uTmZSB9ZReVMjYbj4TWsxnfV5Tc3SrbnvtvSrf0hBM/yh0Eaf88hiTEgy1u3QdRHtZBX3zNkboq1K8CCcH1vJvKfpPscANH9ZoLZyuIkNeCy3E8qUJL+A1goUAEbtaA01MOwmQpDeqoiIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736103732; c=relaxed/simple;
	bh=SJxsTIGQlZCKzBl296AXCopKLeDIquTPA5B+NGpEE+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aj0QBLGedbXYWjPHmT98Ya92oLbf4bynEsKGEmGi35HKI860HdlRiwYgUyq1b7onzc18ZI4HXYeCZ4ZR8pMrQXnRx2z/6drvolB/0K4MGnYvwccXalRd5wfMKEbOJRE7Vf/XQSmoKTIxaj+FJcQgsyetBHZXgOcnmeUUJyAaOSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M7Sf/Jt2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M7Sf/Jt2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7D9BC4CED0;
	Sun,  5 Jan 2025 19:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736103731;
	bh=SJxsTIGQlZCKzBl296AXCopKLeDIquTPA5B+NGpEE+Y=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=M7Sf/Jt2oN0ELBVlkLFS1ixll8QRVz5CL5PyyUPtOrYAuXbgWxf0NiSNzXygTgw7Z
	 O+mmHwU48KVdmdHHGpyYACKDAlLMDlbtfoBgjMElWQ7T7zcfqW5HkC0Be+cZmO4xOw
	 1jk6lNd7LBCr3P74xjNv5tDsAwAUAgTXz2sBSgnNPAvKqieMDT8x5ON1TtxTkOTvoK
	 JGugGPuNZBybzND2ivZBVNmU/WtSqXEX75aj70hrZ+eC+xLSCjaYe60OSu0wH8ym+4
	 z61ohq0fR252rOWsmtdz2KPw8MnZIJrbWj/uYHsNWLCCB6MLeun4Z618mz6GexRyxL
	 9dlqRIev5NboQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 74DC8CE0A35; Sun,  5 Jan 2025 11:02:11 -0800 (PST)
Date: Sun, 5 Jan 2025 11:02:11 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook 0/6] CodeSamples: Make non-default combinations
 of cc and -O levels happy
Message-ID: <a5d64bed-4e80-40e9-aa66-86165f31e3ea@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <bf045b9a-4a09-4c84-9df8-4ec7154144c7@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf045b9a-4a09-4c84-9df8-4ec7154144c7@gmail.com>

On Sun, Jan 05, 2025 at 08:06:38PM +0900, Akira Yokosawa wrote:
> While testing commit f2596972845b ("CodeSamples: Fix liburcu-signal
> support deprecation"), I observed build errors under Ubuntu 22.04.
> 
> Which prompted me to test various combinations of cc and optimization
> levels in building under CodeSamples/.
> 
> This patch set is a collection of fixes/adjustments to make such various
> choices happy.
> 
> Patch 1/6 is a preliminary change for ease of experimenting alternative
> GCC_ARGS such as "-g -Wall -O0", "-g -Wall -O1", and so on, under
> CodeSamples/.
> 
> Patch 2/6 fixes an issue around forward declaration of struct in .h file
> failing to satisfy compiler's assumption of accessing them from inline
> functions.  Looks like this matters with some of gcc versions in low
> level optimization, but gcc of Ubuntu 22.04 hits this even at -O3.
> Actual declaration of a struct seems to be needed in front of inline
> functions who access such a struct.
> 
> Patch 3/6 adjusts indirection level of pointer arguments in xchg().
> 
> Patch 4/6 adds "static" to __inline__ functions.
> 
> Patch 5/6 fixes errors of duplicate symbols due to api.h being included
> in multiple .c files linked together.  As a workaround, "#ifndef SUBOBJ"
> is added in api-pthreads.h and a flag of -DSUBOBJ is added in Makefiles
> to recipes of .c --> _sub.o.
> 
> Patch 6/6 removes variables whose final values are never used.
> Recent clang is pretty strict on set-but-unused variables.
> 
> To test against clang, you need to redirect cc --> clang by, for example,
> symlinking $HOME/bin/cc --> /usr/bin/clang or similar.

Queued and pushed, thank you very much!  And happy perfect-square
new year!

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (6):
>   CodeSamples: Put $(GCC_ARGS) in cc argument list
>   CodeSamples/datastruct: Move struct declaration from .c to .h
>   CodeSamples/advsync: Add explicit type cast in xchg()
>   CodeSamples/count: Add static to __inline__ function declarations
>   CodeSamples: Add #ifndef SUBOBJ to api-pthreads.h
>   CodeSamples/datastruct/Issaquah: Remove unused variables
> 
>  CodeSamples/advsync/q.c                          |  2 +-
>  CodeSamples/advsync/wfenqueue.c                  |  2 +-
>  CodeSamples/api-pthreads/api-pthreads.h          | 14 ++++++++++++++
>  CodeSamples/count/count_end.c                    |  4 ++--
>  CodeSamples/count/count_end_rcu.c                |  4 ++--
>  CodeSamples/count/count_stack.c                  |  6 +++---
>  CodeSamples/count/count_stat_atomic.c            |  6 +++---
>  CodeSamples/datastruct/Issaquah/Makefile         | 14 ++++++++++----
>  CodeSamples/datastruct/Issaquah/existence.c      |  6 ------
>  CodeSamples/datastruct/Issaquah/existence.h      |  7 ++++++-
>  CodeSamples/datastruct/Issaquah/existence_test.c |  3 ---
>  CodeSamples/datastruct/Issaquah/tree.c           |  6 ------
>  CodeSamples/datastruct/hash/Makefile             |  7 +++++--
>  CodeSamples/defer/Makefile                       |  7 +++++--
>  CodeSamples/defer/hazptr.h                       |  6 +++++-
>  CodeSamples/intro/Makefile                       | 12 ++++++------
>  CodeSamples/locking/Makefile                     |  6 +++---
>  17 files changed, 66 insertions(+), 46 deletions(-)
> 
> 
> base-commit: 41e6a800d630336b1d8e614b3d11281e42e880c7
> -- 
> 2.34.1
> 
