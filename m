Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34D15D8F8
	for <perfbook@vger.kernel.org>; Sat,  3 Feb 2024 12:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706964981; cv=none; b=rRwyiIIWfNGZdkVBtUYYXRAEtZqDcDvAWOuye+rUDj2cmEUQmTMkLsw3JtEqrxaKjvKqW0DjC9+Mg0JuVLWj1HSZn6n4cnR3m6R9m3RrfUGySc39RVwJn0PHH9tXpzGb8tKPuG2sDDjDnyIOj+7SxOSo0BoPq0QgOxxGxZt7CK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706964981; c=relaxed/simple;
	bh=UeAg+LVyT22mdJiINuvHqIyDbfrUBoIcHacF0J8uX/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gj+K73tTFtB2xyMmEv4IlWP8Y40ltlcfjVBtFScAswfxsYxvEvZzdY3w37L56uALAAeLMLZpe70LAyVh1uiQLLBlR0h0bJEZ2lGMI9I2RFkAtifzHWnTdKVT0OBhZdGCndiRIpBn6hAnKwYcm/ouuht4T/IWUQaFgBLMuj8IREs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p7Jo6BUd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p7Jo6BUd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FCB9C433F1;
	Sat,  3 Feb 2024 12:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706964980;
	bh=UeAg+LVyT22mdJiINuvHqIyDbfrUBoIcHacF0J8uX/8=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=p7Jo6BUdkj7UqId2Uf3gtrOMqqyhune1mM+bIpRitjosqHiClopksidwyelr18hkv
	 rZe3UkZWr7V8iOt4x8fqFFgibk0tkcG59L/JMvIo5y+tmszlhN+JZKvxVDXF2Xixp5
	 o0GfOgp3S2w0QXIBkYM2HaLrWlxevRDlx+x3yCD8R3dePeBmej8N5DeA1Zw5ik4qL6
	 fhuCXE5JGiwnUHDUXVwA2kfUB8PQBv+6tQwAHQdlN6YaQX90W+GdEyrdlRqhXcXZDu
	 Hd7q6el/buMH2loSUIHr4Yvzxj2JeHGpE/kSbn7KNlwJOPjUTEuyq0zOzjrjJjBLke
	 bwIznLRPk7Kzw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 0E08DCE0D05; Sat,  3 Feb 2024 04:56:20 -0800 (PST)
Date: Sat, 3 Feb 2024 04:56:20 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [RFT PATCH -perfbook 0/2] Retouch plots in QQA 15.31
Message-ID: <948e4860-3152-4802-b2cf-a06531150e45@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <903d71c1-b92c-49a9-8365-a931fcaf2514@gmail.com>
 <94eba816-c48f-4d48-9b33-1ee978b33bdc@paulmck-laptop>
 <b38a195a-1f23-421c-89cb-f79472458599@paulmck-laptop>
 <6159c720-0a7b-4670-895d-27282486148e@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6159c720-0a7b-4670-895d-27282486148e@gmail.com>

On Sat, Feb 03, 2024 at 11:12:39AM +0900, Akira Yokosawa wrote:
> On 2024/01/31 5:20, Paul E. McKenney wrote:
> [...]
> > 
> > Except that github choked on the 366MB coe.out file.  The gzip command
> > compresses it to 72MB, and "tar -cJf" gets it down to 33MB, so maybe I
> > rebase the compressed version into the commit that created that file.
> 
> Quote from github's file size limit at:
>     https://docs.github.com/en/repositories/working-with-files/managing-large-files/about-large-files-on-github#file-size-limits
> 
>     GitHub limits the size of files allowed in repositories. If you
>     attempt to add or update a file that is larger than 50 MiB, you
>     will receive a warning from Git. The changes will still
>     successfully push to your repository, but you can consider removing
>     the commit to minimize performance impact. For more information,
>     see "Removing files from a repository's history."
> 
>     ...
> 
>     GitHub blocks files larger than 100 MiB.
> 
> You hit the github's limit.
> 
> > 
> > And change the script that collects the data to do the compression.  ;-)
> > 
> > Now kernel.org had no problem with the full file, but it might also
> > be good to avoid imposing too much on their storage-space largesse...
> > 
> > Other thoughts?
> 
> Well, no.  Using xz compression looks reasonable to me.

I will need to figure something else out if I ever get access to a system
with (say) 500 CPUs.  If nothing else, split it into one compressed file
per CPU.  I am sure that github will love that.  ;-)

> By the way, you added the following in the answer to QQA 15.31:
> 
>     Alert readers may have noticed that the distribution shown in
>     Figure E.10 is monomodal, which those in Figure E.12 and
>     Figure E.14 are trimodal.
> 
> In coe.png, whose bin_width is 2 I think, I see a spike around
> time period = [38, 40].  Count of time period 40 is 140 and the
> largest count in coe.dat.
> 
> Attached coe.png is the histogram version of the same plot.
> The spike is more evident there.
> 
> This spike causes slight but significant enough bump in the
> right shoulder of Figure E.10 whose bin_width is 40.
> You can still say the distribution is monomodal, but I just
> wanted to make sure.
> 
> Or I can replace the EPS plot with the one with bin_width=2,
> if you prefer.

Thank you for checking, and please do replace that plot.  I will
then reword that text to say something like "almost monomodal" and
"emphatically trimodal".

							Thanx, Paul
