Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IsfdT6JH"
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46AD6C4
	for <perfbook@vger.kernel.org>; Sat,  2 Dec 2023 13:32:12 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-5c2b7ec93bbso1337798a12.2
        for <perfbook@vger.kernel.org>; Sat, 02 Dec 2023 13:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701552732; x=1702157532; darn=vger.kernel.org;
        h=in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LbP17Ow5zgw6FNZDAwLAx1d80ywX84Vl1RdrS5C0LO4=;
        b=IsfdT6JHbpaDmJInVdOsZUCww8wc0V2fodxO3mAYmBDB7z2ItHwm78N6p+Y4dXWjKw
         0t7n5kGo1tqvd/gUpD2IsDLxvp//eXnG9lpH5EntqAHMt/X0nds19oIaH37mEMI8NfZF
         AYAj+k0o3CqxPHsaN3Msqg5aX/9IRxSyTEB32QcMnzLHCkL8C8uk9dnteHVQHgXbAloy
         Pts0H7ipSydjQcGzU4+SYHiTr3rHoVqkqRC4ZdDb4tb+8MfyDJhb38piDdCbPoFcS81r
         iHkMh9Tfd9jYd+NlLu3cbdbORlFNCzqdYcUARoTQuZWtwp+QYMXc2Pnxn9CSMkG9ZnS9
         uGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701552732; x=1702157532;
        h=in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LbP17Ow5zgw6FNZDAwLAx1d80ywX84Vl1RdrS5C0LO4=;
        b=epPL3UFmY1yx9VIHhGcWE9rl+XpSsLkeoZ/1MIfcIVJ99we2AJ4lyDzt9qrwTLWOgf
         RXsJFU4PHbtvUOdkxCwvVmyuGEKv4pFR7k4vr77Fbk9dwNL8GrLNyoAy/l7UoAJdwd5S
         MDJNH0iQ6ppnpTmB9kkyHvYs1yoKLyMcgk+D/hB/PRSdmA+luCja9gFgQpdeh0dUqzLh
         SmIlQ8/rbkl4kMDd2lTQvUvFubOeyaVJC8vh8JD5n39baTXs+4j72W46vqnTEH7OOm1r
         8RIbKsk9ZxpeW1SKeo+B/1as9i9Rd4qrs98mas8d2zMdBCm5nzBI7AVqRvx9qpcD3ScW
         S/+Q==
X-Gm-Message-State: AOJu0Yx5bPBgi1It+ytGx7ulriX4BYG3VCEalrHss0fNygWBCdEg+Urf
	VyufV9lfJ+YD7yQDO7WFsYE=
X-Google-Smtp-Source: AGHT+IFASMQ92mQCxxWOMAaCzggrr7u6tPVwlwYZ5V0l6Nv2klaHi4PAc6JjOpL8wut35kbMYWtwAA==
X-Received: by 2002:a17:903:11c4:b0:1cf:f3a0:3c8e with SMTP id q4-20020a17090311c400b001cff3a03c8emr1949265plh.28.1701552731637;
        Sat, 02 Dec 2023 13:32:11 -0800 (PST)
Received: from localhost.localdomain ([216.243.7.87])
        by smtp.gmail.com with ESMTPSA id h2-20020a170902f7c200b001d0695106c4sm2325469plw.105.2023.12.02.13.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 13:32:10 -0800 (PST)
From: SeongJae Park <sj38.park@gmail.com>
X-Google-Original-From: SeongJae Park <sj@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: SeongJae Park <sj38.park@gmail.com>,
	perfbook@vger.kernel.org
Subject: Re: [PATCH 7/7] future/formalregress: Use SEL4 consistently
Date: Sat,  2 Dec 2023 13:32:09 -0800
Message-Id: <20231202213209.22836-1-sj@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <50a43146-d9dd-45fe-8569-0e33314a4648@paulmck-laptop>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>

On Sat, 2 Dec 2023 11:29:45 -0800 "Paul E. McKenney" <paulmck@kernel.org> wrote:

> On Sat, Dec 02, 2023 at 09:26:14AM -0800, SeongJae Park wrote:
> > formalregress.tex is using mixed use of SEL4 and seL4.  SEL4 is used 8
> > times, while seL4 is used twice over the entire repository.  Use SEL4
> > for the consistency.  Note that use of seL4 in swtools.bib is not
> > changed by this commit.
> > 
> > Signed-off-by: SeongJae Park <sj38.park@gmail.com>
> 
> Nice, thank you!

You're very welcome, Paul!

> 
> I queued and pushed all but this one.  Their website [1] says seL4.
> At least I *think* that this is their website.

Agreed :)

> 
> Either way, I agree that this should be consistent with their naming.

Sure, I will send a new revision soon.

> 
> On the Promela/spin change, should a similar change be applied in the
> Formal Verification chapter?

I already finished the translation of the chapter, but hopefully I will revisit
it soon :)  Don't wait for me, though!


Thanks,
SJ

> 
> 							Thanx, Paul
> 
> [1] https://sel4.systems/
> 
> > ---
> >  future/formalregress.tex | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/future/formalregress.tex b/future/formalregress.tex
> > index b1a39b29..40bf2b35 100644
> > --- a/future/formalregress.tex
> > +++ b/future/formalregress.tex
> > @@ -701,7 +701,7 @@ so they are all yellow with question marks.
> >  	Indeed there are!
> >  	This table focuses on those that Paul has used, but others are
> >  	proving to be useful.
> > -	Formal verification has been heavily used in the seL4
> > +	Formal verification has been heavily used in the SEL4
> >  	project~\cite{ThomasSewell2013L4binaryVerification},
> >  	and its tools can now handle modest levels of concurrency.
> >  	More recently, Catalin Marinas used Lamport's
> > -- 
> > 2.17.1
> > 
> > 
