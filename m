Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BCD4C6F13
	for <perfbook@vger.kernel.org>; Thu,  4 Jun 2026 17:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780594113; cv=none; b=dha10mm1ZW8X7sa9RZ7zvtfR4iA4VV9iYbs2sYVEoDOUMldqVfo5l65Jv5Ug2hQqTUcKXVfEyXftH/LAaFHH0tODFQkK09yk4eP8L+C5cPM6co4PEHSQFamJfB+Ro/6w3jc5Uuji2cOcHMW82fmslKW9ArI8NJU/rn7IM+9eI54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780594113; c=relaxed/simple;
	bh=QviNm+5SnQMZknos0z8ohE//kY0XcBcU30TBRC3Gcic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gftp5LRcLEPsfVY1EzPq5GKOwzskNlYnRRiakEJjlM1cU/XDkbkJKthSneXvr+d7DGQ/IJJNTYkEkhyeX7lqtquBtOWdcsOSWCrecbF5UcjLTUvMxzIaMwd9NCo6bkOq8JNzQmYKCkyNam2RLBztkqME5hZ1pTVM9Z+ZpbCCjC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CD6nUZq9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CD6nUZq9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 072F11F00893;
	Thu,  4 Jun 2026 17:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780594112;
	bh=/RbnhMiWE4eSGairPo6wkZBspRVcnRWqfFE8S0ZFRjM=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=CD6nUZq9rJmmAp1i7sH5PQDrU08fG5BLt6J2Marnb074oDxq/rc+1rfmR9C9tQUUB
	 bDgiXNW+pB+Hw43dDN01eRjHJDL3ym2UhoV+S6U6uqCZvMQRhFfhn5UVlqpYjZ3QgR
	 kQ7zxZmafWYJomPzMbI87qP/WVCQIZ06X8SL2VrMNK/RkRIndK2eQ+/YhOk4YYwAO+
	 bXzpEsFsb4+pXOBD49tMRUF179UHNPBX5x6QATImCayo/FPseQ1Ok44TVK91hrkOGX
	 R9ApJ1KbqfXYF9EjNNiANCkYv6v/Et27rFizKzlU0UiaSFnMck3eF/LIwxkeioP/2k
	 4gzGlqkWB5v9Q==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 76D11CE0555; Thu,  4 Jun 2026 10:28:31 -0700 (PDT)
Date: Thu, 4 Jun 2026 10:28:31 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook 0/6] Updates for LaTeX2e <2026-06-01> release
Message-ID: <a3fcde71-b653-4b2b-8780-7d207370b1fd@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <238a898f-78dd-48ff-b2b8-996b477dbcf6@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <238a898f-78dd-48ff-b2b8-996b477dbcf6@gmail.com>

On Thu, Jun 04, 2026 at 07:10:00PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> Newly released LaTeX2e <2026-06-01> is not compatible with perfbook.
> The new LaTeX kernel doesn't allow both of arydshln and tabularx
> to be loaded in a docment.  As arydshln doesn't play any important
> role in perfbook, I have decided to get rid of it.  See Patch 4/6.
> 
> Another recent headache for perfbook is cleveref.  Patch 5/6 resolves
> it by employing "zref-clever" and defining wrapper commands in the
> preamble.
> 
> The other patches are minor fixes.

Good catches, and I have no idea how my fingers hit "`" instead of the
spacebar!  Thank you very much, queued and pushed.

							Thanx, Paul

> Updates in FAQ-BUILD.txt and under docker/ should follow shortly.
> 
> Thanks, Akira
> 
> --
> Akira Yokosawa (6):
>   memorder: Fix typo ("`" --> " ")
>   runlatex.sh: "iconv -l" rather than "iconv --list"
>   precheck-tentative.sh: Allow "v4.4a" style revision of lineno.sty
>   Get rid of "arydshln"
>   Stop using "cleveref" with LaTeX2e <2024-11-01> and later
>   memorder: Fix use of \cpagerefrange{}{}
> 
>  appendix/styleguide/styleguide.tex | 355 +----------------------------
>  datastruct/datastruct.tex          |  19 +-
>  fixcleveref.ltx                    |  12 -
>  memorder/memorder.tex              |   6 +-
>  perfbook-lt.tex                    |  91 ++++++--
>  utilities/precheck-tentative.sh    |   2 +-
>  utilities/runfirstlatex.sh         |   2 +-
>  utilities/runlatex.sh              |   2 +-
>  8 files changed, 83 insertions(+), 406 deletions(-)
>  delete mode 100644 fixcleveref.ltx
> 
> 
> base-commit: 15b4ca760b07bac138b9e0f6467e6733ecc656dc
> -- 
> 2.43.0
> 
