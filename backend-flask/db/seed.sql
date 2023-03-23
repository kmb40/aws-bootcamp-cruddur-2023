-- this file was manually created
INSERT INTO public.users (display_name, email, handle, cognito_user_id)
VALUES
  ('Andrew Brown','andrew@exampro.co' , 'andrewbrown' ,'MOCK'),
  ('Kyle Brown','mayvik+cloudcamp@gmail.com' , 'kylembrown' ,'MOCK'), --inserting to match query with prod cognito user
  ('Andrew Bayko','bayko@exampro.co' , 'bayko' ,'MOCK'),
  ('Londo Mollari','lmollari@centari.com' ,'londo' ,'MOCK');

INSERT INTO public.activities (user_uuid, message, expires_at)
VALUES
  (
    (SELECT uuid from public.users WHERE users.handle = 'andrewbrown' LIMIT 1), --changing to match query with prod cognito user
    'This was imported as seed data!',
    current_timestamp + interval '10 day'
  )
