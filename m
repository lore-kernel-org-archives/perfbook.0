Return-Path: <SRS0=VvRJ=IV=gmail.com=bsingharora@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XZyNQxlfhb07POYKq6WQibKgyNGxVuqT6p4G+ZkGmjY=;
        b=iGfvtEyChcwLzZsMQeVIm9Xr4pQxgHp1kFIGRXxe9ZZ+e5YOz0zlFDlLAVVAo21dH4
         1fx7YVLxym0nV3YsDUhxa/yvjc7VmFJSrw5hKd+0SwRmRnSE0BCFoyibUv8Grse6IwF0
         r7+Uj+3HUvNPFM+SkO+PMv/bTXmOS5YQwbhk+UYJxK+t6gopKQiQP4ZMCHow0RgTcZLA
         cBJcfMyi01Dkc+TtV/+cASgTvRo4SzltcgD/8jirJ8Jf17zdvWVVLlOCKnX+Oy6T899I
         sruK5tP2wMfI/H/KKx7P4puQBCGIfnaIWDBVCdN9x5d2roUobYXUPquxJAgUltFkyiHu
         HkLw==
Date: Tue, 23 Mar 2021 17:26:53 +1100
From: Balbir Singh <bsingharora@gmail.com>
Subject: Re: [RFC PATCH] perfbook/papersize: ebook reader size support
Message-ID: <20210323062653.GI77072@balbir-desktop>
References: <20210323010153.GH77072@balbir-desktop>
 <20210323052354.GS2696@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323052354.GS2696@paulmck-ThinkPad-P72>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Mon, Mar 22, 2021 at 10:23:54PM -0700, Paul E. McKenney wrote:
> On Tue, Mar 23, 2021 at 12:01:53PM +1100, Balbir Singh wrote:
> > 
> > Add support for ebooksize, which is roughly the size of
> > a kindle (4.5in, 6.3in) with margin size of 0.2in. The
> > recommended changes were taken from stackexchange with
> > links in the code. Not all tables take nicely to the
> > new nice and warnings are produced, which causes warnings
> > about overfull hbox's to be generated. This mode enforces
> > single column output and increases the size of the pdf
> > by almost 40% in terms of number of pages. The final output
> > though is very readable on the kindle I own.
> > 
> > I've been running the command via
> > 
> > env PERFBOOK_PAPER=ER make perfbook-1c.pdf
> > 
> > and love the output so far.
> > 
> > Signed-off-by: Balbir singh <bsingharora@gmail.com>
> 
> Very good!
> 
> But would it be possible to create a separate build target for this
> combination?  Just in case others are using 1c for normal-sized paper?
>

Sure, will do.

Balbir Singh. 
