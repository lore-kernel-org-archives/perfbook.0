Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFB4289E1F
	for <perfbook@vger.kernel.org>; Fri, 20 Jun 2025 10:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750417181; cv=none; b=cvEBDmkhKNKKsGkCfhu4x7E4AcSES2AXiob/H847aPYHH/WpFzG9VAst6R18HNN/29KySvAXyeKLonoP1lQ2a27pki6CSQvC0Fe5QATfKQSv8KWdIfaexXA/brAmGHIqpQ5H6Vy5WcPdH8/mNatXHQAjiU2Fi+2a1SQlFtpnLLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750417181; c=relaxed/simple;
	bh=VxLHfZr6DXtJrJfet18NILoRAM2UwgpaMLGs70LC6JE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Voebb+SmqmJZpwFPSSZtWz+kN4eK92ZSXEKzV7ZvBnV70J87EaztvbE4NLvHno0dgXsUsSNnRolCdIRiNop6Uh17Q3lEspMagBhODuClKCWVNOvs1ttwVOz++JNZxUtksQ/GR+1lQH7VNdFHua0y3NychaPmGEdf0a2CHlxux24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UmTmcnvy; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UmTmcnvy"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2366e5e4dbaso13235455ad.1
        for <perfbook@vger.kernel.org>; Fri, 20 Jun 2025 03:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750417178; x=1751021978; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W/dfLcgHijNWM41btflFKuBPb3fduFvB2IlqquGx6QE=;
        b=UmTmcnvyqPupKXMS2952zpFr0i92DF5vSkjlmSKZJd8tAxisOu2htLdhJpMFHq5xGY
         Kd7sNovwym5SJUgblXnn0ZerQjBvxjZ+xrlNpa+hBlpZ9yiupMAu7jfGd8KhYUoYtPSC
         Y1dyaSxiPFqLyh6pH1QHO9AkeWRyK9gqugjuJLxYOcL5iJ0PZOOF10rYFP/ma331ZqsJ
         o9tTR65RDa/W11htodpjrpb9Fwrrfp4V02JpBLELJ342GPj6605JSwb0LHSvAN0nlvTM
         CQSloCgwfcfO+WJxOGg/JTY0jHqTxNm9VnEvKkl9kAUtarIpV2EqmHQnbZ0VI4IAcRE7
         XWJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750417178; x=1751021978;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W/dfLcgHijNWM41btflFKuBPb3fduFvB2IlqquGx6QE=;
        b=OtlW2JfsOR7LSw5q/4l9JK0TMv2F4yakYHCfh2DSEa/stJN81QgyEigkXjAF4yUrzM
         U1J/cYIGeMsBCvtEbmqsYT86f1GehB96Q2NkpMKrQ0x1YTyjbmpg6C0bvXyUESc4RbDb
         izcKV3EnJQaWpjNr9nMK9dVslIs5DhrZI2UCAebnna+eDUj2DhWomqtqJ5v4zugwBaIi
         Ip6eh9bYxBy2Nl0fGmkOjX2SeCTdt8J+jyoZR7D5SlGtB1w1TX+4Vd500nMKIzoPu5Xp
         k4T91ecDHcdjGO/q5XWAXnCXB/RjUmZIVnoBq2j6/i95eYnpAeyKUNXzegp0GOUCMNKx
         O+4A==
X-Gm-Message-State: AOJu0Yzciuq+L75eTIIqB+CBwKW3m6fvuqpLP6EpxiZO9PMp2CZyLrl8
	FE2jOTb3+tm2Io3qGPQDkCnVx54tXJTR+tIuTINJOUtF2fxzkiSq6uUV
X-Gm-Gg: ASbGnctB55W4413whhYtZPXqI/g4QPEY1LKX4kGqDaLIH1u4GK3b8xWatqcXksmrhEg
	JmfVTpJqURbx+2bhfK7eXhajXB13gOBY5Jx1azJgWcecKYSPlaJKrdepP0teBgOEBS0pJYMc+4k
	bC42tZNDSxFyIKg3hWhTFpiwdoYvKCBd3ihvxTFc6+6cgH8cSGZeHGmaI5cxU7+ut1+ydW71iqX
	ECNmmHVadhx1i+nRLKnIL2wOh+50WnW0V9dGl6qyLfTCHKW9mTtDGcJ2IGSEC6Q757QdNuAPp2X
	qHpLU7oIpUKjRhYTaQpHxUec+eKEPF3nWvODOsLu0nhNOf/GGRdr836nAjCdpH/ibHfQKMbNUsT
	hRu0cYxokK5+IUQMiDbhcni9aLITxyS+d
X-Google-Smtp-Source: AGHT+IFWKqqGXx0z/9XOyhYLpIVL1fy4MIYDrG6vo7gqs2q2RXeUf/ST50e9E3E54Ea8YUWu5JMFHQ==
X-Received: by 2002:a17:902:ccce:b0:233:d3e7:6fd6 with SMTP id d9443c01a7336-237db0cef88mr34258795ad.19.1750417178297;
        Fri, 20 Jun 2025 03:59:38 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83d3af7sm15626145ad.69.2025.06.20.03.59.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 03:59:38 -0700 (PDT)
Message-ID: <53199ddf-f7c9-44cd-8fb8-8e4a659353d5@gmail.com>
Date: Fri, 20 Jun 2025 19:41:53 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -perfbook] gitlab-ci: Append /usr/bin/*_perl to PATH
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Leonardo Bras <lsoaresp@redhat.com>,
 Akira Yokosawa <akiyks@gmail.com>
References: <8820751b-9b42-4408-b388-14f42030b891@gmail.com>
 <89277ea0-1e60-416d-ac00-526574f74189@gmail.com>
 <53d8230a-adef-4b14-a0cf-96a0d41ae7dc@paulmck-laptop>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <53d8230a-adef-4b14-a0cf-96a0d41ae7dc@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Thu, 19 Jun 2025 23:58:08 -0700, Paul E. McKenney wrote:
> On Fri, Jun 20, 2025 at 01:44:45PM +0900, Akira Yokosawa wrote:
>> On Sat, 14 Jun 2025 11:33:16 +0900, Akira Yokosawa wrote:
>>> Subject: [PATCH -perfbook] gitlab-ci: Append /usr/bin/*_perl to PATH
>>>
>>> Under archlinux-based container runs, non-login shells need to source
>>> /etc/profile to have package-specific commands such as encguess (under
>>> /usr/bin/core_perl) appended in its PATH.
>>>
>>> Add the command so that the change in commit 00361e8bb1e5 ("Convert
>>> *.log files into UTF-8 encoding") to work in gitlab-ci builds.
>>>
>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>>> Cc: Leonardo Bras <lsoaresp@redhat.com>
>>> ---
[...]

>> Paul, having failed to hear from Leo, can I ask you to take and push this?
>> I will see the log of Leo's gitlab-CI job once it finishes.
> 
> Done!  And I will of course be happy to take any updates that might
> prove necessary.

Leo's gitlab-CI have finished successfully.  All looks good!

       Thanks, Akira

