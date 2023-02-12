Return-Path: <SRS0=U30B=6I=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0cX2V+tldBKMYUSs6sdLZg2cZchhqMTxAOGRhpm86yk=;
        b=dbcM8h2/Ub9JHuy0uLF3ve3Hb6vAt53jfJEBy+19avShxCw60vCf0705qj17Dqf2No
         kdWCt/skbl1qtVOtOFXfNOjT18MIMNslgwCLzla7TBSpsCUJElPhwfpc+9oItgvsPVe4
         0BBfGgBvIgS8PII17YsIp4ulBg9bqEa+1XAydmn0WDnTm5kp5dAR3SxigrBPtpWX1cTt
         KyfhBg83qLsFYgg+F+Y/IaP2Xuq96XA0u5Z0gyqJSFH4I1GWk1plpmLXYQHAUPUF8NMd
         jBCX2pKiTUUEq6xvkNACDUHc3uaBISKPxyavwBhnYfEjcbCAoIDUK0k6qwgrpOJpEu/o
         IYUg==
From: SeongJae Park <sj38.park@gmail.com>
Subject: Re: [PATCH v2 1/4] debugging: Use \co{} for 'time' output examples
Date: Sun, 12 Feb 2023 08:46:07 -0800
Message-Id: <20230212164607.25170-1-sj@kernel.org>
In-Reply-To: <7b6bc6fd-f19f-b50f-b5f2-8e948d60a67e@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org, sj@kernel.org, paulmck@kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi Akira,

On Sun, 12 Feb 2023 21:02:12 +0900 Akira Yokosawa <akiyks@gmail.com> wrote:

> Hi SeongJae,
> 
> I might be nit-picky, but just couldn't help.
> 
> On Sat, 11 Feb 2023 09:10:05 -0800, SeongJae Park wrote:
> > A quick quiz answer in debugging.tex is wrapping 'time' example outputs
> > with only `` and ''.  Use \qco{} instead.
> 
> In the subject, "Use \co{} for ..." should be "Use \qco{} for ...".

You're right, thank you for letting me know this.  Will fix the subject in the
next spin.


Thanks,
SJ

[...]
