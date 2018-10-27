Return-Path: <andrea.parri@amarulasolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1zmR48DEk3MVZ4qzEGo9cU8ZVKeveycHIjwzCyWrO0k=;
        b=TtKhapDzk72v6yCDaypx6yHcs1/+oIj2kmtG5OGWuICNDixdleDBgZbtSGqjDYfjco
         APCGicKK6HbBBrCEZpYY4kiyMgxQ9Ng5nKybVBX4Iv/VhtBN9VIyCbfIi0f5jKZjhfxj
         nBDva3NpK3CWfL7/zn2gTxS7E/yMx7/+yJrM4=
Date: Sat, 27 Oct 2018 14:58:44 +0200
From: Andrea Parri <andrea.parri@amarulasolutions.com>
Subject: Re: perfbook
Message-ID: <20181027125844.GA6083@andrea>
References: <20181025083609.GA6766@andrea>
 <20181025100235.GR4170@linux.ibm.com>
 <20181026202014.GA4905@andrea>
 <8e6bc30b-d35f-e03e-9af4-14398bddf5b1@gmail.com>
 <20181026221402.GA5769@andrea>
 <96dcab56-15ff-0af2-0322-1b95b561c16b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96dcab56-15ff-0af2-0322-1b95b561c16b@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "Paul E. McKenney" <paulmck@linux.ibm.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

> Just want to make sure the gs version.
> 
> "gs -v" on my Ubuntu 18.04 says:
> 
> GPL Ghostscript 9.25 (2018-09-13)
> Copyright (C) 2018 Artifex Software, Inc.  All rights reserved.
> 
> What does your "gs -v" say?

It said:

GPL Ghostscript GIT PRERELEASE 9.25 (2018-03-21)
Copyright (C) 2018 Artifex Software, Inc.  All rights reserved.

which suggested that my previous "from ubuntu 18.04" was in fact not
matching reality: it looks like I installed gs from sources, only a
few months ago, and completely forgot about it. ;/  Mah, I manually
removed my binary (/usr/local/bin/gs), and apt-purged-and-installed
fig2ps ghostscript ghostscript-x gv.


Now it says:

GPL Ghostscript 9.25 (2018-09-13)
Copyright (C) 2018 Artifex Software, Inc.  All rights reserved.

which seems to match what you reported above.  I was then able to
generate perfbook.pdf, even though with a bunch of:

CodeSamples/SMPdesign/smpalloc.canonical.eps --> CodeSamples/SMPdesign/smpalloc.canonical.pdf
GPL Ghostscript 9.25: Unrecoverable error, exit code 1

I only had a quick look at the generated .pdf, but I haven't noticed
issues.  Are those errors expected?  Any other suggestion?

Thanks,
  Andrea


> 
>         Akira

