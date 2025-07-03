Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A142E7649
	for <perfbook@vger.kernel.org>; Thu,  3 Jul 2025 15:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751555213; cv=none; b=Cb575AtDCegJ7s3fDq6V+sYTWjWgtvR5XhQdnlQibVO2cV0vX6MIMukx+bAxCkvoY4uHQXw4616M8GFx89vBpaakjed30sQ/NCXEyBls9rSLvMCnuNUJuV839BooWEQFYGeCj3Iia5SGqU7kFWefXU1jxPqI74P11HqMjcrMDqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751555213; c=relaxed/simple;
	bh=9vB9+b5EXMCRXlIsiQHkLwib6dbvkOTk8pS5xbI3WNg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition; b=AAHpQBVjwcSetesgnJhQUpwQD/cgHRqic3KYaIk4iUcCp+K41MgDMOX90n2UKbhDfZpC6f3WU39YLER0nRTFkJ4yrR2BH1jkpil4GD8H84fvOQoElSwKvA63xMO+3XkR7tOLGRXmUw5DBjfx2Zo+z6S3HTtZVSpWQlreLUkWfqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gY3Q+rsn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gY3Q+rsn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751555211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iQ6bR9TDaxWBsRhrcfN5MYElbhUhTbGyeawxj9xkvq4=;
	b=gY3Q+rsn632l/Fi76LGgAdLjEkMj4Euuly/JlqtQT++EdCkjWlstKKnjt5GKAO65KQUWIc
	xZL+R2rZLj3tD9THw2K7ATlpilA2ErQ0oTcOdREDB/g3T9stW2qs1xm/3qRMX+mCVq5paZ
	czqKCOh9TdOJ+hNS6+mJeLmQbf8Wk7g=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-VrPZdcUJOcOx_3TNBHQjsA-1; Thu, 03 Jul 2025 11:06:46 -0400
X-MC-Unique: VrPZdcUJOcOx_3TNBHQjsA-1
X-Mimecast-MFC-AGG-ID: VrPZdcUJOcOx_3TNBHQjsA_1751555206
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a98d1ed40aso16028201cf.1
        for <perfbook@vger.kernel.org>; Thu, 03 Jul 2025 08:06:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751555206; x=1752160006;
        h=content-transfer-encoding:content-disposition:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iQ6bR9TDaxWBsRhrcfN5MYElbhUhTbGyeawxj9xkvq4=;
        b=VrxJF2fIV/VjM3NNMEmwjy4b5zcjiRDfBHVthX3TZmQmV03I+qfZ+1pdlOIcMv3mZM
         A5niBox1TJ2q2IksCvXbOodl9tqe17N352uuigSyAAuTdvVGiC19HfnWSoG2xosUiD1D
         jAbXOmVgPPVgE3G/2LLHSUuAMqB2zm5F01Bu6oFoZR6WirIgLRBlTeaxmXuaoHx1aX2a
         wE/yeTPKHshQLsqpik8wdrUN9gxLMUW6ZiAZOEImM2KLVhIuJ0hHG6ae9vUU36ZpfiiC
         hgWs37c+bNGzdrSsrpqJ5uffSV2YtR8ZFeoAb1LjImLHC/UNtjEaWXIz5JBq8qGCN1U4
         TNnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmj8Qz4CDvSjSRYqQO8LXjevWwB1lcGWHnsXrGJ6Q06uxhr6S+IM7vG339RgcDM9MdeIgBUFkCRg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc5wxnPTX1OuKWILDqGDp0pKExWvXE69IUq5DFARdxTCfE+3Dv
	gLGwDO/lUVEArJGZWPgyT7JTOBYMyeKoB2bZ8lHP4SoGPrBcCwVrRUHbf+KWOh8TlUgXCdckVc0
	MsZXTr5QPGP13FMdNuI9cPAKu4gl+X6WBwks5XpUuGs0f3S7W03jlF590gCQv
X-Gm-Gg: ASbGncvInx6jypgsFceCKUsnZgFsJ3+Pd6t9XhV8xrzQgTjbSQkoUX69syUvZW/n5BR
	3fuIYiJHhgo3VNeItxYc7GfLTyzXFOfnXhuit+wtjUI7EQIt2TnH3uQ/IqZoMsVffxr4GrjB9df
	B99DDE4hbCUtgZxJldqtH44BSbEAqYtCfZOk6QCcucivW264ckBdrYIc28zueCR2t8gzUfnbdZ2
	+n9KWrV6Bwbdmf0Ni3dfOmf3hrjEONNWJwDY7wy18Qlta9GazeUf/9eokfJqvOQLAAhY3tkyewp
	VMVbtyFZIHcuwvbMQhoMCj0UBEQwRpIr
X-Received: by 2002:ac8:5942:0:b0:4a8:5a:9e2f with SMTP id d75a77b69052e-4a97692a5a6mr122791551cf.8.1751555206025;
        Thu, 03 Jul 2025 08:06:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOnIHl+mDywwpIE6uSSAVN3AVElMHC3rYYzD/+YbEihtlhtJhc/U+TzWB9p/fNk6eh1khiuQ==
X-Received: by 2002:ac8:5942:0:b0:4a8:5a:9e2f with SMTP id d75a77b69052e-4a97692a5a6mr122790621cf.8.1751555205296;
        Thu, 03 Jul 2025 08:06:45 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:1b3:a803:156f:8199:a862:a4c8:882f])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc106163sm109050031cf.1.2025.07.03.08.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 08:06:44 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Leonardo Bras <leobras@redhat.com>,
	Akira Yokosawa <akiyks@gmail.com>,
	perfbook@vger.kernel.org,
	Leonardo Bras <lsoaresp@redhat.com>
Subject: Re: [PATCH -perfbook] gitlab-ci: Append /usr/bin/*_perl to PATH
Date: Thu,  3 Jul 2025 12:06:38 -0300
Message-ID: <aGacfnxb6KpF0Wye@LeoBras>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <291997d0-53f9-4052-a0b3-905b94b746c3@paulmck-laptop>
References: <8820751b-9b42-4408-b388-14f42030b891@gmail.com> <89277ea0-1e60-416d-ac00-526574f74189@gmail.com> <53d8230a-adef-4b14-a0cf-96a0d41ae7dc@paulmck-laptop> <53199ddf-f7c9-44cd-8fb8-8e4a659353d5@gmail.com> <291997d0-53f9-4052-a0b3-905b94b746c3@paulmck-laptop>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Jun 20, 2025 at 04:17:37AM -0700, Paul E. McKenney wrote:
> On Fri, Jun 20, 2025 at 07:41:53PM +0900, Akira Yokosawa wrote:
> > On Thu, 19 Jun 2025 23:58:08 -0700, Paul E. McKenney wrote:
> > > On Fri, Jun 20, 2025 at 01:44:45PM +0900, Akira Yokosawa wrote:
> > >> On Sat, 14 Jun 2025 11:33:16 +0900, Akira Yokosawa wrote:
> > >>> Subject: [PATCH -perfbook] gitlab-ci: Append /usr/bin/*_perl to PATH
> > >>>
> > >>> Under archlinux-based container runs, non-login shells need to source
> > >>> /etc/profile to have package-specific commands such as encguess (under
> > >>> /usr/bin/core_perl) appended in its PATH.
> > >>>
> > >>> Add the command so that the change in commit 00361e8bb1e5 ("Convert
> > >>> *.log files into UTF-8 encoding") to work in gitlab-ci builds.
> > >>>
> > >>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > >>> Cc: Leonardo Bras <lsoaresp@redhat.com>
> > >>> ---
> > [...]
> > 
> > >> Paul, having failed to hear from Leo, can I ask you to take and push this?
> > >> I will see the log of Leo's gitlab-CI job once it finishes.
> > > 
> > > Done!  And I will of course be happy to take any updates that might
> > > prove necessary.
> > 
> > Leo's gitlab-CI have finished successfully.  All looks good!
> 
> Very good, and thank you!
> 
> 							Thanx, Paul
> 

Hi Akira, Paul,

Sorry for the delay on replying. I have been majorly focused on an internal 
project and unfortunatelly have been neglecting patch-tagged e-mails.

I have nothing against the change, and I am happy it works :)

Thank you for finding out the issue and fixing it, and thanks Paul for 
pushing it so it could be tested!

Thanks! 
Leo

