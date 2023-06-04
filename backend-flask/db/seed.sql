-- this file was manually created
INSERT INTO public.users (display_name, email, handle, cognito_user_id)
VALUES
  ('Andrew Brown','andrew@exampro.co' , 'andrewbrown' ,'MOCK'),
  ('Alt Brown','mayvik+altcloudcamp@gmail.com' , 'altkylembrown' ,'MOCK'), --inserting to test hardcode removal fix
  ('Kyle Brown','mayvik+cloudcamp@gmail.com' , 'kylembrown' ,'MOCK'), --inserting to match query with prod cognito user
  ('Andrew Bayko','bayko@exampro.co' , 'bayko' ,'MOCK'),
  ('Londo Mollari','lmollari@centari.com' ,'londo' ,'MOCK');

INSERT INTO public.activities (user_uuid, message, expires_at)
VALUES
  (
    (SELECT uuid from public.users WHERE users.handle = 'andrewbrown' LIMIT 1),
    'This was imported as seed data!',
    current_timestamp + interval '10 day'
  ),
  (
    (SELECT uuid from public.users WHERE users.handle = 'altkylembrown' LIMIT 1),
    'I am the other!',
    current_timestamp + interval '10 day'
  );